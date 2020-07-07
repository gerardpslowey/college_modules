function getWeekNumber(d) {
    // Copy date so don't modify original
    d = new Date(Date.UTC(d.getFullYear(), d.getMonth(), d.getDate()));
    // Get first day of school year which is september
    var yearStart = new Date(Date.UTC(d.getUTCFullYear(),8,23));
  
    var weekNo = Math.ceil(( ( (d - yearStart) / 86400000) + 1)/7);
    // Return array of year and week number
    return [weekNo];
  }
  var result = getWeekNumber(new Date());
  document.write('Week ' + result);