window.addEventListener('DOMContentLoaded', event => {
  // Simple-DataTables
  // https://github.com/fiduswriter/Simple-DataTables/wiki

  const datatablesSimple = document.getElementById('datatablesSimple');
  if (datatablesSimple) {

    let options = {
      labels: {
        perPage: "件表示",
        info: "{rows}件中、{start} 〜 {end}件を表示",
        noRows: "該当するデータはありません"

      },
      columns: [
        { select: 0, sort: "desc"},
        { select: 2, filter: ["データなし"]},
        { select: [0, 1], headerClass: "link-primary table-light"},
        { select: [2], headerClass: "link-danger table-light"},
        { select: [3], headerClass: "table-light"},
        { select: [0, 1, 2, 4], cellClass: "align-middle" }
      ],
      searchable: false,
      fixedHeight: true,
      caption: "キャプション"
    };
    
    let dataTable = new simpleDatatables.DataTable(datatablesSimple, options);
  }
});