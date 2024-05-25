import router from '@ohos.router';
import gridItem from '../model/GridModel';
import mainViewModel from '../model/ModelView'
@Entry
@Component
export default struct HomePage {

  build() {
    Scroll() {
      Column() {
        Text('首页')
          .width('90%')
          .height(40)
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
          .margin({ top: 10 })
        Swiper() {
          SwiperBuilder($r('app.media.fig1'))
          SwiperBuilder($r('app.media.fig2'))
          SwiperBuilder($r('app.media.fig3'))
          SwiperBuilder($r('app.media.fig4'))
        }
          .autoPlay(true)
          .loop(true)
          .indicator(true)
          .margin({ top: 10 })
          .width('90%')
        Grid(){
          ForEach(mainViewModel.getFirstGridData(),(item:gridItem)=>{
            GridItem(){
              Column(){
                Image(item.img)
                  .width(40)
                  .height(40)
                Text(item.title)
                  .height(30)
                  .fontSize(16)
              }
            }
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .width('90%')
        .height(140)
        .margin({top:10})
        .maxCount(4)
        .layoutDirection(GridDirection.Row)

        Text('列表')
          .width('90%')
          .height(40)
          .fontSize(18)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10 })

        Grid(){
          ForEach(mainViewModel.getSecondGridData(),(item:gridItem)=>{
            GridItem(){
              Column(){
                Text(item.title)
                  .height(30)
                  .width('100%')
                  .fontSize(16)
                  .fontColor(Color.White)
                Text(item.others)
                  .height(30)
                  .width('100%')
                  .fontSize(12)
                  .fontColor(Color.White)
              }
              .padding({left:10})
              .alignItems(HorizontalAlign.Start)
            }
            .height('100%')
            .width('100%')
            .borderRadius(12)
            .align(Alignment.TopStart)
            .backgroundImage(item.img)
            .backgroundImageSize(ImageSize.Cover)
          })
        }
        .columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .rowsGap(12)
        .columnsGap(8)
        .width('90%')
        .height(260)
      }
      .width('100%')
    }
  }
}
@Builder
function  SwiperBuilder(img: Resource) {
  Image(img)
    .width('100%')
    .height(200)
    .borderRadius(14)
}