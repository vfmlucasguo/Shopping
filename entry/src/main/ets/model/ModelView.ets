import gridItem from './GridModel';

export class MainViewModel {

  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
      $r('app.media.fig1'),
      $r('app.media.fig2'),
      $r('app.media.fig3'),
      $r('app.media.fig4')
    ];
    return swiperImages;
  }


  getFirstGridData(): Array<gridItem> {
    let firstGridData: gridItem[] = [
      new gridItem($r('app.string.my_love'), $r('app.media.love')),
      new gridItem($r('app.string.history_record'), $r('app.media.record')),
      new gridItem($r('app.string.message'), $r('app.media.message')),
      new gridItem($r('app.string.shopping_cart'), $r('app.media.shopping')),
      new gridItem($r('app.string.my_goal'), $r('app.media.target')),
      new gridItem($r('app.string.group'), $r('app.media.circle')),
      new gridItem($r('app.string.favorites'), $r('app.media.favorite')),
      new gridItem($r('app.string.recycle_bin'), $r('app.media.recycle'))
    ];
    return firstGridData;
  }


  getSecondGridData(): Array<gridItem> {
    let secondGridData: gridItem[] = [
      new gridItem($r('app.string.mainPage_top'), $r('app.media.top'), $r('app.string.mainPage_text_top')),
      new gridItem($r('app.string.mainPage_new'), $r('app.media.new'), $r('app.string.mainPage_text_new')),
      new gridItem($r('app.string.mainPage_brand'), $r('app.media.brand'), $r('app.string.mainPage_text_brand')),
      new gridItem($r('app.string.mainPage_found'), $r('app.media.found'), $r('app.string.mainPage_text_found'))
    ];
    return secondGridData;
  }


  getMeListData(): Array<gridItem> {
    let settingListData: gridItem[] = [
      new gridItem($r('app.string.setting_list_news'), $r('app.media.news'), $r("app.string.setting_toggle")),
      new gridItem($r('app.string.setting_list_data'), $r('app.media.data')),
      new gridItem($r('app.string.setting_list_menu'), $r('app.media.menu')),
      new gridItem($r('app.string.setting_list_storage'), $r('app.media.storage')),
      new gridItem($r('app.string.setting_list_privacy'), $r('app.media.privacy')),
      new gridItem($r('app.string.setting_list_about'), $r('app.media.about'))
    ];
    return settingListData;
  }
}

export default new MainViewModel();