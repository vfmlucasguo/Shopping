import router from '@ohos.router'
import gridItem from '../model/GridModel'
import mainViewModel from '../model/ModelView'
@Entry
@Component
export default struct MePage {
  build() {
    Scroll() {
      Column() {
        Text('我的')
          .width('90%')
          .height(40)
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
          .margin({ top: 10 })
        Row(){
          Image($r('app.media.account'))
            .width(60)
            .height(60)
            .borderRadius(30)
          Column(){
            Text('张先生')
              .fontSize(18)
            Text('500110366@qq.com')
              .fontSize(14)
              .margin({top:5})
          }
          .padding({left:15})
          .alignItems(HorizontalAlign.Start)
        }
        .width('90%')
        .borderRadius(12)
        .backgroundColor('#FFFFFF')
        .padding({left:20,top:10,bottom:10,right:10})
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Start)
        
        List(){
          ForEach(mainViewModel.getMeListData(),(item:gridItem)=>{
            ListItem(){
              Row(){
                Row(){
                  Image(item.img)
                    .width(22)
                    .height(22)
                  Text(item.title)
                    .fontSize(16)
                    .margin({left:5})
                }
                if (item.others === undefined) {
                  Image($r('app.media.right_grey'))
                    .width(12)
                    .height(24)
                } else {
                  Toggle({ type: ToggleType.Switch, isOn: false })
                }
              }
              .padding(10)
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
            }
          })
        }
        .divider({
          strokeWidth: 1,
          startMargin: 33,
          endMargin: 10,
          color: '#ffe9f0f0'
        })
        .width('90%')
        .margin({top:20})
        .borderRadius(12)
        .backgroundColor('#FFFFFF')
        
        Blank()

        Button('退出',{type:ButtonType.Capsule,stateEffect:true})
          .width('80%')
          .height(40)
          .margin({top:60,bottom:30})
          .fontColor(Color.Red)
          .backgroundColor('#E5E8EA')
          .onClick(() => {
            router.replaceUrl({url:'pages/LoginPage'})
          })
      }
      .height('100%')
      .width('100%')
      .backgroundColor('#F5F5F5')
    }
  }
}