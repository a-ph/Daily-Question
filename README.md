# Daily-question
iOS Tips

每天更新iOS小知识，希望对大家有些帮助

1：倒计时

从服务器拿到倒计时秒数，eg：{“product”：“001”,“time”：“100000”}，{“product”：“002”,“time”：“200000”}，然后nstimer 每秒向这个数据里的每个商品时间-1，可见visiblecell 的显示时间控件重新赋值  参考：photos timer

2：数据存储

plist  nsuserdefault  nskeyedarchiver  sqlite3(FMDB)  core data (不建议使用单独使用，建议项目整体使用)

3：优购 筛选

不过就是多选问题而已。
