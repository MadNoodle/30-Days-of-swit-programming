//
//  Movies.swift
//  videoPlayer
//
//  Created by Mathieu Janneau on 28/02/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

enum Sources{
  case local,distant
}
class Movies {
  var thumbnail: String
  var url: String
  var title: String
  var source:Sources
  
  init(title:String, thumbnail:String, url: String,source:Sources){
    self.title = title
    self.thumbnail = thumbnail
    self.url = url
    self.source = source
  }
}
struct Data {
  static let movies = [
    Movies(title:"Load local Video", thumbnail:"amf1", url: "/Users/mathieujanneau/Desktop/videoPlayer/videoPlayer/SupportingFiles/amf.mp4", source: .local),
    Movies(title:"Justice League", thumbnail:"justice", url: "https://r3---sn-ab02a0nfpgxapox-bh2ee.googlevideo.com/videoplayback?c=WEB&key=yt6&mime=video%2Fmp4&expire=1519859367&id=o-AMKB77rev-m__TiO4bUvhbc_3anxrA8bAmJMI-hzYIsC&signature=325DA0BA9E68A4E9FA7B1FEC1A861689B30AA2B0.DF419D2666D5CE3F013DE6B267F10110702B90A3&ms=au%2Crdu&pcm2cms=yes&mv=m&mt=1519837678&itag=22&pl=22&mn=sn-ab02a0nfpgxapox-bh2ee%2Csn-oguelned&ip=124.54.78.137&mm=31%2C29&requiressl=yes&ei=RuKWWu76Nu2BgAPvuIDYBg&initcwndbps=1310000&source=youtube&ipbits=0&lmt=1507473300027892&sparams=dur%2Cei%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpcm2cms%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cusequic%2Cexpire&usequic=no&fvip=2&dur=193.491&ratebypass=yes&video_id=r9-DM9uBtVI&title=JUSTICE+LEAGUE+-+Official+Heroes+Trailer", source:.distant),
    Movies(title:"Master Yoda", thumbnail:"yoda", url: "https://r3---sn-q4flrnee.googlevideo.com/videoplayback?fvip=1&id=o-ALk5DjTc1CBMeqVtZA7R3sPE7_E597vMaDhWq0u4GHCJ&expire=1519852281&key=yt6&mime=video%2Fmp4&ip=23.106.75.46&lmt=1472219732849027&ipbits=0&sparams=dur%2Cei%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cexpire&itag=22&c=WEB&ei=mcaWWtf8IM-YuwXQhYeIDA&dur=45.348&pl=19&initcwndbps=2171250&mv=m&source=youtube&ratebypass=yes&signature=CC96C2CB15CE8A8A1619EED97CF93F962D575877.0F7843FDAB84ED331E4AF9E20E26BA901958C1E8&ms=au%2Crdu&mn=sn-q4flrnee%2Csn-q4f7sn7e&mm=31%2C29&mt=1519830586&requiressl=yes&video_id=8U9X6I0xVNc&title=Ma%C3%AEtre+Yoda+-+%C2%ABFais-le%2C+ou+ne+le+fais+pas%2C+mais+il+n%27y+a+pas+d%27essai.%C2%BB", source:.distant),
    Movies(title:"Demolition", thumbnail:"demolition", url: "https://r3---sn-aigl6ned.googlevideo.com/videoplayback?lmt=1507313132569152&c=WEB&initcwndbps=118750&ei=2-aWWr7EOYGjVI_HmcAG&fvip=3&sparams=dur%2Cei%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cexpire&expire=1519860540&signature=98B713494542F6F110651238F6E44FDB0014BB57.858396D9B8096D5B1C0D5C26956EF3FD7DCC924D&ipbits=0&ratebypass=yes&mn=sn-aigl6ned%2Csn-aigllnsy&pl=20&mm=31%2C29&requiressl=yes&dur=140.666&id=o-AIIyrnRTkNui-csZSOi7tINrql7ywZ03vVbbEW-3vz2V&source=youtube&itag=22&key=yt6&ip=139.162.216.218&mime=video%2Fmp4&mv=m&mt=1519838855&ms=au%2Crdu&video_id=a80Hmk7vGSQ&title=Demolition+Official+Trailer+%232+%282016%29+-+Jake+Gyllenhaal%2C+Naomi+Watts+Movie+HD", source:.distant),
    Movies(title:"Ghost in the shell", thumbnail:"ghost", url: "https://r4---sn-x5guiuxaxjvh-q5jl.googlevideo.com/videoplayback?c=WEB&ip=103.254.94.190&ipbits=0&signature=6E175878B48AE4BDFADE811263A3EF71098905FC.AE0FDEF969E659DB87353B796DA731ADCCFFED66&sparams=dur%2Cei%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cexpire&id=o-AHR9Htv0SJO7YKRFR5TPCwZqvs1IQWNTL-EKI7jbMZmx&ei=LeeWWvjSIZTDogOPxKawBQ&itag=22&initcwndbps=117500&fvip=7&lmt=1479188630797417&requiressl=yes&dur=150.349&mime=video%2Fmp4&ratebypass=yes&mn=sn-x5guiuxaxjvh-q5jl%2Csn-h557sne7&mm=31%2C29&ms=au%2Crdu&mv=m&mt=1519838926&expire=1519860622&key=yt6&pl=24&source=youtube&video_id=AQipnFp8Yxs&title=GHOST+IN+THE+SHELL+Bande+Annonce+VF+%282017%29+Scarlett+Johansson", source:.distant),
    Movies(title:"Hell or High water", thumbnail:"hell", url: "https://r6---sn-4pvgq-n8ve.googlevideo.com/videoplayback?signature=2BAC9900C741B0778DDD15BFDE06094F7D223AC1.D8DA6B28CA91ECF3D4A7DCBA536E012D1E50DC3F&source=youtube&fvip=14&nh=%2CIgpwcjA0LnN2bzA2KgkxMjcuMC4wLjE&ratebypass=yes&itag=22&ipbits=0&lmt=1507275987489776&c=WEB&sparams=dur%2Cei%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cexpire&mn=sn-4pvgq-n8ve%2Csn-n8v7kn7z&mm=31%2C29&ip=46.44.40.161&dur=161.518&id=o-ADU4YMYMpMSUWz3cFqY0NaJWGw39bOwd51JQjQ9SrWJd&mime=video%2Fmp4&ms=au%2Crdu&requiressl=yes&pl=18&mv=m&mt=1519838993&expire=1519860691&initcwndbps=1172500&key=yt6&ei=c-eWWvr3G5Ls7QS215jAAw&video_id=JQoqsKoJVDw&title=HELL+OR+HIGH+WATER+-+Official+Trailer+HD", source:.distant),
    Movies(title: "Collateral", thumbnail: "collateral", url: "https://r3---sn-4pvgq-3c2l.googlevideo.com/videoplayback?fvip=3&itag=18&ei=2ueWWtz0O9TodPD_qmA&requiressl=yes&sparams=clen%2Cdur%2Cei%2Cgir%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cexpire&gir=yes&mime=video%2Fmp4&mn=sn-4pvgq-3c2l%2Csn-n8v7znly&c=WEB&id=o-ABUw3S8jhzXzbkcmJpuBE7_9A6lgdosnYitbGw0TggCJ&dur=134.025&mt=1519839066&mv=m&ms=au%2Crdu&ip=46.44.48.224&clen=5161684&ratebypass=yes&lmt=1412402371783951&expire=1519860795&source=youtube&nh=%2CIgpwcjA0LnN2bzA2KgkxMjcuMC4wLjE&key=yt6&ipbits=0&initcwndbps=993750&pl=18&mm=31%2C29&signature=1EF7F4D574C2F7104A58900D65D57012D034079E.1EF784E42256674F4834BF33187AAB1DFD97DB90&video_id=9BDx6ZPHV4w&title=Collateral+Movie+Trailer", source: .distant)
  ]
}
