// Function to fetch location data based on the selected province ID
function fetchLocationData(url, targetElementId) {
    $.ajax({
        url: url,
        method: 'GET',
        dataType: 'json',
        success: function (data) {

            const targetElement = $('#' + targetElementId);
            targetElement.empty(); // Clear previous options

            if (targetElementId == "province") {
                $.each(data, function (index, item) {
                    let option;
                    if (provinceInit == item.name) {
                        option = $('<option selected></option>').val(item.code).text(item.name).attr('data-name', item.name);
                    } else {
                        option = $('<option></option>').val(item.code).text(item.name).attr('data-name', item.name);
                    }
                    targetElement.append(option);
                });
            }
            else if (targetElementId.includes("district")) {
                $.each(data.districts, function (index, item) {
                    let option;
                    if (districtInit == item.name) {
                        option = $('<option selected></option>').val(item.code).text(item.name).attr('data-name', item.name);
                    } else {
                        option = $('<option></option>').val(item.code).text(item.name).attr('data-name', item.name);
                    }
                    targetElement.append(option);
                })
            } else {
                $.each(data.wards, function (index, item) {
                    let option;
                    if (wardInit == item.name) {
                        option = $('<option selected></option>').val(item.code).text(item.name).attr('data-name', item.name);
                    } else {
                        option = $('<option></option>').val(item.code).text(item.name).attr('data-name', item.name);
                    }
                    targetElement.append(option);
                })
            }
            // Iterate through the received data and create options

        },
        error: function (xhr, status, error) {
            console.error('Error fetching location data:', error);
        }
    });
}
const API_ENDPOINT = 'https://provinces.open-api.vn/api';
var provinceInit = $('#province').val();
var districtInit = $('#district').val();
var wardInit = $('#ward').val();

$('#province').one('click', function () {
    const districtUrl = `${API_ENDPOINT}/p/`;
    fetchLocationData(districtUrl, 'province');
})

// Event listener for the province select dropdown
$('#province').on('change', function () {
    const provinceId = $(this).val();
    const districtUrl = `${API_ENDPOINT}/p/${provinceId}/?depth=2`;
    fetchLocationData(districtUrl, 'district');
});

// Event listener for the district select dropdown
$('#district').on('change', function () {
    const districtId = $(this).val();
    const wardUrl = `${API_ENDPOINT}/d/${districtId}?depth=2`;
    fetchLocationData(wardUrl, 'ward');
});

// $('#ward').on('change', function () {
//     $('#ward-is').val($('#ward option:selected').data('name'))
// });

$(document).on('click', '#updateInfoUser', function () {


    $(".err-modify-tv").remove();

    let status_error = false;

    if ($("#fullname").val() == '') {
        $("#fullname").after(`<span class="err-modify-tv color-red">* Vui lòng nhập tên người nhận hàng.</span>`);
        $("#fullname").focus();
        status_error = true;
    }
    if ($("#phone").val() == '') {
        $("#phone").after(`<span class="err-modify-tv color-red">* Vui lòng nhập số điện thoại.</span>`);
        $("#phone").focus();
        status_error = true;
    }
    if ($("#province").val() == null) {
        $("#province").after(`<span class="err-modify-tv color-red">* Vui lòng chọn địa chỉ.</span>`);
        $("#province").focus();
        status_error = true;
    }
    if ($("#district").val() == null) {
        $("#district").after(`<span class="err-modify-tv color-red">* Vui lòng chọn địa chỉ.</span>`);
        $("#district").focus();
        status_error = true;
    }
    if ($("#ward").val() == null) {
        $("#ward").after(`<span class="err-modify-tv color-red">* Vui lòng chọn địa chỉ.</span>`);
        $("#ward").focus();
        status_error = true;
    }
    if ($("#street").val() == '') {
        $("#street").after(`<span class="err-modify-tv color-red">* Vui lòng nhập địa chỉ.</span>`);
        $("#street").focus();
        status_error = true;
    }

    if (status_error) return false;

    var fullname = $('#fullname').val();
    var phone = $('#phone').val();
    var province = $('#province option:selected').data('name')
    var district = $('#district option:selected').data('name')
    var ward = $('#ward option:selected').data('name')
    var street = $('#street').val();

    // Create a new FormData object
    var formData = new FormData();
    formData.append('fullname', fullname);
    formData.append('phone', phone);
    formData.append('province', province);
    formData.append('district', district);
    formData.append('ward', ward);
    formData.append('street', street);

    _doAjaxNodCustom('POST', formData, 'order_index', 'index', 'updateInfoUser', true, (res) => {
        // Call the _doAjaxNodCustom function

        if (res.status == 200) {
            Toastify({
                text: res.message,
                duration: 3000, // Set the duration for how long the toast should be displayed
                gravity: "top-right", // Set the position of the toast (e.g., "top", "bottom", "center")
                close: true, // Enable the close button on the toast
                backgroundColor: "#3cb815",
            }).showToast();

        } else {
            Toastify({
                text: res.message,
                duration: 3000, // Set the duration for how long the toast should be displayed
                gravity: "top-right", // Set the position of the toast (e.g., "top", "bottom", "center")
                close: true, // Enable the close button on the toast
                backgroundColor: "#FF0000",
            }).showToast();
            return false;
        }
    });
})


$(document).on('click', '#checkoutSubmit', function () {

    var payment_method = $('#payment_method').val()
    // Create a new FormData object
    var formData = new FormData();
    formData.append('payment_method', payment_method);

    _doAjaxNodCustom('POST', formData, 'order_index', 'index', 'payment', true, (res) => {
        // Call the _doAjaxNodCustom function

        if (res.status == 200) {
            Toastify({
                text: res.message,
                duration: 2000, // Set the duration for how long the toast should be displayed
                gravity: "top-right", // Set the position of the toast (e.g., "top", "bottom", "center")
                close: true, // Enable the close button on the toast
                backgroundColor: "#3cb815",
            }).showToast();
            setTimeout(() => {
                window.location = domain + '/xac-nhan-thanh-toan'
            }, 1500);


        } else {
            Toastify({
                text: res.message,
                duration: 3000, // Set the duration for how long the toast should be displayed
                gravity: "top-right", // Set the position of the toast (e.g., "top", "bottom", "center")
                close: true, // Enable the close button on the toast
                backgroundColor: "#FF0000",
            }).showToast();
            return false;
        }
    });
})

