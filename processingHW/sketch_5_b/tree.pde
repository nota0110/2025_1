void drawTree(float ty, float gr) {
  // 가로수 treeY > ty, gridRoad > gr
  fill(20, 173, 3);
  for (int x=50; x<width; x+=(10*gr)) {
    float treeX = x;
    triangle(treeX, ty-3*gr, treeX-1.5*gr, ty, treeX+1.5*gr, ty);
  }
}
