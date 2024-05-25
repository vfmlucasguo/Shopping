import router from '@ohos.router';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct LoginPage {

  @State account: string = '';
  @State password: string = '';
  @State isLoading: boolean = false;
  private TimerId: number = -1;

  login(){
    if (this.isLoading) {
      return
    }
    if (this.account.length < 6 || this.password.length <6) {
      promptAction.showToast({
        message:'账号或密码不能少于6位',
        duration: 2000,
        bottom: 100
      })
      return
    }
    this.isLoading = true
    this.TimerId = setTimeout(()=>{
      this.isLoading = false
      this.TimerId = -1;
      router.replaceUrl({ url: 'pages/Index' })
    },1000)
  }
  build() {
    Column() {
      Column({space:10}){
        Image($r('app.media.logo'))
          .width(60)
          .height(60)
          .borderRadius(14)
        TextBuilder('登录界面',20,$r('app.color.black'),true)
        TextBuilder('登录账号以使用更多服务',14,$r('app.color.text_grey'))
      }
      .margin({top:70})
      Column() {
        TextInput({placeholder:'账号'})
          .InputFnc(14)
          .maxLength(12)
          .onChange((value: string)=>{
            this.account = value
          })
        Line()
          .LineFnc()
        TextInput({placeholder:'密码'})
          .InputFnc(14)
          .type(InputType.Password)
          .showPasswordIcon(true)
          .margin({top:10})
          .onChange((value: string)=>{
            this.password = value
          })
        Line()
          .LineFnc()
        Row() {
          TextBuilder('短信验证码登录',15,$r('app.color.login_text_color'))
          TextBuilder('忘记密码',15,$r('app.color.login_text_color'))
        }
        .width('90%')
        .margin({top:10})
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .width('100%')
      .margin({top:50})
      Button('登录',{type:ButtonType.Capsule,stateEffect:true})
        .width('80%')
        .height(40)
        .margin({top:60})
        .backgroundColor($r('app.color.login_text_color'))
        .onClick(() => {
          this.login()
        })
      TextBuilder('注册账号',15,$r('app.color.login_text_color'))
      if (this.isLoading) {
        LoadingProgress()
          .color($r('app.color.text_grey'))
          .width(60)
          .height(60)
          .margin({ top: 20 })
      }
      Blank()
      Column(){
        TextBuilder('其他登录方式',13,$r('app.color.text_grey'))
        Row(){
          RoundButtonBuilder($r('app.media.huawei'))
          RoundButtonBuilder($r('app.media.wechat'))
          RoundButtonBuilder($r('app.media.weibo'))
        }
        .width('70%')
        .justifyContent(FlexAlign.SpaceAround)
      }
      .margin({bottom:30})
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.bg_grey'))
  }
}

@Builder
function TextBuilder(title: string,fontSize:number,fontColor:Resource,isBold?:boolean) {
  Text(title)
    .height(30)
    .fontSize(fontSize)
    .fontColor(fontColor)
    .fontWeight(isBold? FontWeight.Bold :FontWeight.Normal)
}

@Builder
function  RoundButtonBuilder(img: Resource) {
  Button({type:ButtonType.Circle}){
    Image(img)
  }
  .width(46)
  .height(46)
  .backgroundColor($r('app.color.white'))
}

@Extend(Line) function LineFnc() {
  .height(1)
  .width('90%')
  .backgroundColor($r('app.color.line_grey'))
}

@Extend(TextInput) function InputFnc(fontSize:number) {
  .fontColor(Color.Red)
  .fontSize(fontSize)
  .backgroundColor($r('app.color.bg_grey'))
}