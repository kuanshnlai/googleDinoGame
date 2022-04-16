# googleDinoGame
嘗試用processing實作google小恐龍遊戲，用方向鍵上或空白鍵來控制恐龍跳躍  
碰撞偵測使用AABB矩形方法來檢測，因此在某些點位會誤判  
舉例來說小恐龍的圖如下，可以看到小恐龍並未撞到仙人掌卻被判定撞到
<br>
![image](https://user-images.githubusercontent.com/57993994/163662859-0d67d4ae-c99d-4a3e-bb21-6a56752b5355.png)
<br>
解決法式使用SAT分離軸法來實作但目前還在嘗試中
遊戲畫面
![image](https://user-images.githubusercontent.com/57993994/163662652-917a89b5-63c5-40d8-975d-bc9f6ff1b095.png)

GameOver畫面
![image](https://user-images.githubusercontent.com/57993994/163662630-c9456721-b3d6-4565-a527-c8d8c961405c.png)
