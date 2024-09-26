var citis = document.getElementById("city");
var districts = document.getElementById("district");
var wards = document.getElementById("ward");
var data = [];


var Parameter = {
  url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
  method: "GET",
  responseType: "application/json",
};

var promise = axios(Parameter);
promise.then(function (result) {
  data = result.data;
  renderCity();
  setDefaultAddress(add1, add2, add3); 
});

function renderCity() {
  for (const x of data) {
    citis.options[citis.options.length] = new Option(x.Name, x.Id);
  }
}

function renderDistricts() {
  districts.length = 1;
  ward.length = 1;
  if (citis.value != "") {
    const result = data.filter((n) => n.Id === citis.value);
    for (const k of result[0].Districts) {
      districts.options[districts.options.length] = new Option(k.Name, k.Id);
    }
  }
}

function renderWards() {
  wards.length = 1;
  const dataCity = data.filter((n) => n.Id === citis.value);
  if (districts.value != "") {
    const dataWards = dataCity[0].Districts.filter((n) => n.Id === districts.value)[0].Wards;
    for (const w of dataWards) {
      wards.options[wards.options.length] = new Option(w.Name, w.Id);
    }
  }
}

function setDefaultAddress(cityName, districtName, wardName) {
  setDefaultCity(cityName);
  setDefaultDistrict(districtName);
  setDefaultWard(wardName);
}

function setDefaultCity(cityName) {
  const defaultCity = data.find((city) => city.Name.includes(cityName));
  if (defaultCity) {
    citis.value = defaultCity.Id;
    renderDistricts();
  }
}

function setDefaultDistrict(districtName) {
  const dataCity = data.find((n) => n.Id === citis.value);
  const defaultDistrict = dataCity.Districts.find((district) => district.Name.includes(districtName));
  if (defaultDistrict) {
    districts.value = defaultDistrict.Id;
    renderWards(); 
  }
}

function setDefaultWard(wardName) {
  const dataCity = data.find((n) => n.Id === citis.value);
  const dataDistrict = dataCity.Districts.find((n) => n.Id === districts.value);
  const defaultWard = dataDistrict.Wards.find((ward) => ward.Name.includes(wardName));
  if (defaultWard) {
    wards.value = defaultWard.Id;
  }
}

citis.onchange = function () {
  renderDistricts();
};

districts.onchange = function () {
  renderWards();
};