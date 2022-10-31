Date.prototype.myMet = function () {
    if (this.getMonth() == 0) { this.myProp = "Tháng 01" };
    if (this.getMonth() == 1) { this.myProp = "Tháng 02" };
    if (this.getMonth() == 2) { this.myProp = "Tháng 03" };
    if (this.getMonth() == 3) { this.myProp = "Tháng 04" };
    if (this.getMonth() == 4) { this.myProp = "Tháng 05" };
    if (this.getMonth() == 5) { this.myProp = "Tháng 06" };
    if (this.getMonth() == 6) { this.myProp = "Tháng 07" };
    if (this.getMonth() == 7) { this.myProp = "Tháng 08" };
    if (this.getMonth() == 8) { this.myProp = "Tháng 09" };
    if (this.getMonth() == 9) { this.myProp = "Tháng 10" };
    if (this.getMonth() == 10) { this.myProp = "Tháng 11" };
    if (this.getMonth() == 11) { this.myProp = "Tháng 12" };
}

function myFunction() {
    var d = new Date();
    d.myMet();
    var x = document.getElementById("demo");

    x.innerHTML = d.myProp;


}