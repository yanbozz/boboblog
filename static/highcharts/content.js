
  // 图表配置
  // let viewData = JSON.parse('{{ view_data | tojson }}');
  var options = {
    chart: {
      type: 'line'                          //指定图表的类型，默认是折线图（line）
    },
    title: {
      text: null                 // 标题
    },
    xAxis: {
      categories: ['1', '2', '3', '4', '5', '6', '7']   // x 轴分类
    },
    yAxis: {
      title: {
        text: null              // y 轴标题
      },
      labels: {
        enables:false
      },
      legend: {
        enables:false
      },
      // credits: {
      //   enables:false
      // },
    },
    series: [{                              // 数据列
      name: '阅读量',                        // 数据列名
      data: [1, 0, 4]                   // 数据
    },]
  };
  // 图表初始化函数
  var chart = Highcharts.chart('container', options);
