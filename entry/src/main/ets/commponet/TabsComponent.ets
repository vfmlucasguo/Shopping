@Component
@Entry
export default struct TabsComponent {
  private tabsController : TabsController = new TabsController()
  @State currentIndex:number = 0;
  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource){
    Column(){
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({width:25,height:25})
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(()=>{
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex)
    })
  }
  build() {
    Tabs(){
      TabContent(){
        Column(){
          Text('1')
        }
      }.tabBar(this.TabBuilder('首页',0,$r('app.media.ic_home_selected'),$r('app.media.ic_home')))
      TabContent(){
        Column(){
          Text('1')
        }
      }.tabBar(this.TabBuilder('我的',1,$r('app.media.ic_mine_selected'),$r('app.media.ic_mine')))
    }
    .barPosition(BarPosition.End)
  }
}