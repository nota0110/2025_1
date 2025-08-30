import os
import cv2
import subprocess
from tqdm import tqdm
from skimage.metrics import structural_similarity as ssim

# --- 풀 링크로 변환 ---
def convert_to_full_youtube_url(url):
    if "youtu.be" in url:
        video_id = url.split("/")[-1].split("?")[0]
        return f"https://www.youtube.com/watch?v={video_id}"
    return url.split("?")[0]  # 그냥 세션만 제거


# --- 유튜브 다운로드 (yt-dlp 기반) ---
def download_youtube_video(url, save_dir, filename):
    try:
        clean_url = convert_to_full_youtube_url(url)
        output_path = os.path.join(save_dir, filename)

        # yt-dlp 명령어 구성 (720p 화질 제한 포함)
        command = [
            "yt-dlp", clean_url,
            "-f", "bestvideo[height<=720]+bestaudio/best[height<=720]",
            "-o", output_path,
            "--merge-output-format", "mp4"
        ]

        # 실시간 콘솔 출력용 subprocess
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)

        # 줄 단위로 읽으면서 콘솔에 출력
        for line in process.stdout:
            print(line.strip())

        process.wait()  # 다운로드 완료까지 기다리기

        if process.returncode == 0:
            print(f"✅ 다운로드 완료: {filename}")
            return True
        else:
            print(f"❌ 다운로드 실패 ({filename}) (코드 {process.returncode})")
            return False

    except Exception as e:
        print(f"❌ yt-dlp 실행 중 예외 발생 ({filename}): {e}")
        return False



# --- 프레임 슬라이싱 ---

def slice_video_by_second(video_path, sliced_base_folder):
    video_name = os.path.splitext(os.path.basename(video_path))[0]
    output_folder = os.path.join(sliced_base_folder, f"{video_name}frames")
    os.makedirs(output_folder, exist_ok=True)

    cap = cv2.VideoCapture(video_path)
    if not cap.isOpened():
        print(f"❌ 영상 열기 실패: {video_path}")
        return None

    fps = cap.get(cv2.CAP_PROP_FPS)
    total_frames = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
    duration_sec = int(total_frames / fps)

    print(f"🎬 '{video_name}' 슬라이싱 시작 (길이: {duration_sec}초)")

    for sec in tqdm(range(duration_sec), desc=f"🎞 슬라이싱 {video_name}", ncols=80):
        target_frame = int(sec * fps)
        cap.set(cv2.CAP_PROP_POS_FRAMES, target_frame)
        success, frame = cap.read()
        if success:
            filename = f"frame_{sec:04d}.jpg"
            cv2.imwrite(os.path.join(output_folder, filename), frame)
        else:
            print(f"⚠️ {sec}초 프레임 읽기 실패")

    cap.release()
    return output_folder


# --- 중복 필터링 ---
def load_gray_cropped(path, crop_coords):
    img = cv2.imread(path)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    y1, y2, x1, x2 = crop_coords
    return gray[y1:y2, x1:x2]

def filter_unique_images(input_folder, project_base_folder, crop_ratio=(0.20, 0.62, 0.42, 0.62), threshold=0.95):
    input_folder_name = os.path.basename(input_folder)
    prefix = input_folder_name.replace("frames", "").rstrip("_")
    output_folder = os.path.join(project_base_folder, "uni", f"{prefix}Unique")
    os.makedirs(output_folder, exist_ok=True)

    files = sorted([f for f in os.listdir(input_folder) if f.lower().endswith(('.jpg', '.png'))])
    if not files:
        print(f"❌ 이미지 없음: {input_folder}")
        return

    sample_img = cv2.imread(os.path.join(input_folder, files[0]))
    h, w = sample_img.shape[:2]
    y1 = int(h * crop_ratio[0])
    y2 = int(h * crop_ratio[1])
    x1 = int(w * crop_ratio[2])
    x2 = int(w * crop_ratio[3])
    crop_coords = (y1, y2, x1, x2)

    prev_crop = None
    saved_count = 0

    for file in tqdm(files, desc=f"📦 {prefix} 필터링 중", ncols=80):
        path = os.path.join(input_folder, file)
        cropped = load_gray_cropped(path, crop_coords)

        if prev_crop is None or ssim(prev_crop, cropped) < threshold:
            cv2.imwrite(os.path.join(output_folder, file), cv2.imread(path))
            saved_count += 1
            prev_crop = cropped

    print(f"✅ {prefix} 필터링 완료: {saved_count}장 저장됨 → {output_folder}")

# --- 전체 처리 파이프라인 ---
def process_youtube_videos(video_list, base_dir):
    video_dir = os.path.join(base_dir, "videoForSlicing")
    sliced_dir = os.path.join(base_dir, "slicedFrames")
    os.makedirs(video_dir, exist_ok=True)

    for video in video_list:
        url = video["url"]
        name = video["name"]
        filename = f"{name}.mp4"
        video_path = os.path.join(video_dir, filename)

        # 1. 유튜브 다운로드
        video_path = os.path.join(video_dir, filename)

        if os.path.exists(video_path):
            print(f"⚠️ 이미 존재: {filename}, 다운로드 생략")
        else:
            success = download_youtube_video(url, video_dir, filename)
            if not success:
                continue

        # 2. 슬라이싱
        sliced_folder = slice_video_by_second(video_path, sliced_dir)
        if sliced_folder is None:
            continue

        # 3. 필터링
        filter_unique_images(sliced_folder, base_dir)

# --- 사용 예시 ---
videos = [
    {"url": "https://youtu.be/g0Scm0bOz4A?si=87uHTm0P9LJzvdC4", "name": "4_1_Avillon"},
    {"url": "https://youtu.be/hr1uoPmOhAc?si=LLcmuxVj3rgtH3sJ", "name": "4_2_Nibelung"},
    {"url": "https://youtu.be/_AQJXpJ2I00?si=HOJGovkSl3gNTYJ7", "name": "4_3_DeepForest"},
    {"url": "https://youtu.be/xrl6HoV_oGo?si=pqBvwiBzUjncUzop", "name": "4_4_Lumisade"},
    {"url": "https://youtu.be/n10s67_oDUE?si=S2dHlDvawhrABgtG", "name": "4_5_Rhodon"},
    {"url": "https://youtu.be/esuloPwvRos?si=RbJt1UGR9TvJGrHG", "name": "4_6_Varhya"},
    {"url": "https://youtu.be/syW5Srff5qM?si=4LedlbBVQOHPz2NB", "name": "4_7_Lunaris"},
    {"url": "https://youtu.be/rUKOzmm2U4w?si=Y82WVGGaaghR13Z0", "name": "4_8_Isola"},
    {"url": "https://youtu.be/ra4ms5kHcLM?si=Wiq8orzMLrU9gmbH", "name": "4_9_Archipelago"},
    {"url": "https://youtu.be/rXayhAlyXPo?si=nFMrGSdCH48r3gOJ", "name": "4_10_Dakkeon"},
    {"url": "https://youtu.be/SEa9Y1lriYg?si=KwyPRLRuQXSE2tfk", "name": "4_11_W_Gallus"},
    {"url": "https://youtu.be/PhgpqZsRUAs?si=ltUqON54fi4uET-Q", "name": "4_12_E_Gallus"},
    {"url": "https://youtu.be/E9cpswbgd7U?si=RNZ09B9CwtHVlwQl", "name": "4_13_TheOrigin"}
]

process_youtube_videos(videos, base_dir="/Users/yun/Desktop/projects25/videoOCR")
