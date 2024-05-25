import TabsComponent from '../commponet/TabsComponent';
import HomePage from './HomePage';
import MePage from './MePage';

@Entry
@Component
struct Index {
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
      Tabs({
        barPosition: BarPosition.End,
        controller: this.tabsController
      }){
        TabContent(){
          HomePage()
        }.tabBar(this.TabBuilder('首页',0,$r('app.media.ic_home_selected'),$r('app.media.ic_home')))
        TabContent(){
          MePage()
        }.tabBar(this.TabBuilder('我的',1,$r('app.media.ic_mine_selected'),$r('app.media.ic_mine')))
      }
      .width('100%')
      .backgroundColor(Color.White)
      .barHeight(50)
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
    }
}