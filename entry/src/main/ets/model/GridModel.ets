export default  class gridItem {
  img: Resource
  title: Resource
  others?: Resource;
  constructor(title: Resource,img: Resource ,others?:Resource) {
    this.img = img;
    this.title = title;
    this.others = others
  }
}