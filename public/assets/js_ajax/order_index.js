// Function to fetch location data based on the selected province ID
function fetchLocationData(url, targetElementId) {
    $.ajax({
        url: url,
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data);
            const targetElement = $('#' + targetElementId);
            targetElement.empty(); // Clear previous options

            // Iterate through the received data and create options
            $.each(data, function (index, item) {
                const option = $('<option></option>').val(item.id).text(item.name);
                targetElement.append(option);
            });
        },
        error: function (xhr, status, error) {
            console.error('Error fetching location data:', error);
        }
    });
}

const provinceUrl = `${API_ENDPOINT}/provinces`;
fetchLocationData(provinceUrl, 'province');

const API_ENDPOINT = 'https://provinces.open-api.vn/api/';

$('#province').on('click', function () {
    const districtUrl = `${API_ENDPOINT}`;
    fetchLocationData(districtUrl, 'province');
})

// Event listener for the province select dropdown
$('#province').on('change', function () {
    const provinceId = $(this).val();
    const districtUrl = `${API_ENDPOINT}/districts?provinceId=${provinceId}`;
    fetchLocationData(districtUrl, 'district');
});

// Event listener for the district select dropdown
$('#district').on('change', function () {
    const districtId = $(this).val();
    const wardUrl = `${API_ENDPOINT}/wards?districtId=${districtId}`;
    fetchLocationData(wardUrl, 'ward');
});