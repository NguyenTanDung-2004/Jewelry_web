/**
 * 
 */
const monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"];

const yearSelect = document.querySelector('.year-select');
const monthSelect = document.querySelector('.month-select');
const daySelect = document.querySelector('.day-select');

const date = new Date();
const currentYear = date.getFullYear(); // Lấy năm hiện tại

// Hàm tạo tùy chọn tháng
function createOptionMonth() {
  for (let i = 0; i < monthNames.length; i++) {
    const option = document.createElement('option');
    option.value = i + 1;
    option.textContent = monthNames[i];
    monthSelect.appendChild(option);
  }
}

// Hàm tạo tùy chọn năm
function createOptionYear() {
  for (let y = currentYear; y >= 1970; y--) {
    const option = document.createElement('option');
    option.value = option.textContent = y;
    yearSelect.appendChild(option);
  }
}

// Hàm tạo tùy chọn ngày
function createOptionDay(year, month) {
  daySelect.innerHTML = '';
  const daysInMonth = new Date(year, month, 0).getDate();

  for (let day = 1; day <= daysInMonth; day++) {
    const option = document.createElement('option');
    option.value = option.textContent = day;
    daySelect.appendChild(option);
  }

}

// Thêm tùy chọn cho năm và tháng
createOptionMonth();
createOptionYear();

// Bắt sự kiện thay đổi của năm và tháng => thuy đổi tùy chọn cho ngày
monthSelect.addEventListener('change', function () {
  const selectedMonth = monthSelect.value;
  const selectedYear = yearSelect.value;
  createOptionDay(selectedYear, selectedMonth);
})
yearSelect.addEventListener('change', function() {
  const selectedMonth = monthSelect.value;
  const selectedYear = yearSelect.value;
  createOptionDay(selectedYear, selectedMonth);
})

// Dặt giá trị mặc định cho ngày sinh
monthSelect.value = 3; 
yearSelect.value = 2004;
createOptionDay(2004,3);
daySelect.value = 29;