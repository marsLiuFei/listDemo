# iOS缓存高度之商品评论

首先看一下效果
![效果图.gif](https://upload-images.jianshu.io/upload_images/3363476-4260f69ad6f7c862.gif?imageMogr2/auto-orient/strip)

Demo中使用了几个三方
![image.png](https://upload-images.jianshu.io/upload_images/3363476-b00d0d47f1296ecd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/3363476-42de9a9f08d8b77e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

注： 查看大图片的这个工具有点坑，不知道是我不会使用还是原本就有bug，坑在下面的这个地方，如果不修改的话，会导致下拉刷新的操作被屏蔽，因为offset距离顶部为0了，刚好被屏蔽了。
![image.png](https://upload-images.jianshu.io/upload_images/3363476-0d54f2f9be63c182.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##言归正传说Demo
cell主要由三部分组成：
第一部分是用户基本信息和文字评论区域，第二部分是图片显示部分，独立出去的一个XBWCSMyOrderEvaluationImageView，这样方便操控view的显示，如果需要3*3矩阵布局或者其他4*2矩形布局的，也方便布局。唯一注意的是imageview的复用，防止图片混乱，造成最终查看大图造成崩溃。第三部分是商家回复区域，也是独立出去的XBWCSMyOrderEvaluationReplyView。
![image.png](https://upload-images.jianshu.io/upload_images/3363476-482f3d3171979a26.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
布局说完了，说高度的问题。
像这种的文字较多，不确定高度的cell，就需要用到缓存高度的思想，一方面是为了布局的正确性，另一方面是为了优化cell的流畅度。我们知道在tableview的滑动过程中，会不断的调用

    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
这个方法，如果将cell的高度计算放在这里，将会造成不可限量的消耗，可能数据量小的时候看不出来，但是量多了，就可怕了。
大多数的高度缓存思想，无非就是拿到数据即拿到高度，数据是死的，高度也就是死的，只是看怎么去处理这个高度。
![image.png](https://upload-images.jianshu.io/upload_images/3363476-77c373fccd08687f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

在获取到数据的时候，剥离出去一个方法，用于计算cell的高度。同时在创建数据model的时候，多添加一个cellHeight属性，将计算好的高度再次赋值给cellHeight这个属性。
![image.png](https://upload-images.jianshu.io/upload_images/3363476-ca05599d4a1abe8f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
这样我们就将需要的高度缓存起来了，在后面需要的时候，取出cellHeight就可以了。
![image.png](https://upload-images.jianshu.io/upload_images/3363476-5dfa59e25b067965.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

计算文字高度，其实很简单就是计算富文本size
![image.png](https://upload-images.jianshu.io/upload_images/3363476-e6afdd51d1bedc05.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

额外补充下查看大图的方法
![image.png](https://upload-images.jianshu.io/upload_images/3363476-97299c34dab66f2e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

