function distance(lat1, lon1, lat2, lon2) {
  var r = 3959;
  var lat1Radians = lat1.toRadians();
  var lat2Radians = lat2.toRadians();
  var latChange = (lat2 - lat1).toRadians();
  var lonChange = (lon2 - lon2).toRadians();
  var a = Math.sin(latChange / 2) * Math.sin(lat1 / 2) + Math.cos(lat1Radians / 2) * Math.cos(lat2Radians) * Math.sin(lonChange / 2) * Math.sin(lonChange / 2);
  var c = Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

  var totalDistance = r * c;
  document.getElementById("test").innerHTML = totalDistance;
}