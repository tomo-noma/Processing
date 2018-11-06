// マップデータクラス
class BG{
  private int chip; //チップサイズ
  private int sqWidth; //マス目の幅
  private int sqHeight; //マス目の高さ
  private int[][] map; //マップチップの配置
  
  BG(int _chip, int _sqWidth, int _sqHeight){
    chip = _chip;
    sqWidth = _sqWidth;
    sqHeight = _sqHeight;
    map = new int[sqWidth][sqHeight];
  }
  
  int mapWidth(){
    return map.length;
  }
  
  int mapHeight(){
    return map[0].length;
  }
  
  int windowWidth(){
    return chip * sqWidth;
  }
  
  int windowHeight(){
    return chip * sqHeight;
  }
  
  void setMap(int[][] _map){
    map = _map;
  }
  
  int[][] getMap(){
    return map;
  }
}
