
$(document).on('click', '.delete-product', function () {

    // Show the SweetAlert confirmation dialog
    Swal.fire({
        title: 'Bạn có chắc chắn muốn xóa sản phẩm này?',
        text: "Hành động này không thể hoàn tác!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Đồng ý',
        cancelButtonText: 'Hủy bỏ'
    }).then((result) => {
        if (result.isConfirmed) {
            //    alert('helo');
            //    return
            // Create a new FormData object
            var like_id = $(this).data('like-id');


            // console.log(like_id);
            // return;
            var formData = new FormData();

            formData.append('id',like_id);

            _doAjaxNodCustom('POST', formData, 'likeproduct_index', 'index', 'deletelike', true, (res) => {
                // Call the _doAjaxNodCustom function
                //  alert('heloo');
                if (res.status == 200) {
                    var domain = res.data.domain;
                    domain = domain.replace(/"/g, '');
                    fetchData(res.data.product, domain, "#tbl_data_likeproduct");

                    Toastify({
                        text: res.message,
                        duration: 2000, // Set the duration for how long the toast should be displayed
                        gravity: "top-right", // Set the position of the toast (e.g., "top", "bottom", "center")
                        close: true, // Enable the close button on the toast
                        backgroundColor: "#3cb815",

                    }).showToast();
                } else {
                    Toastify({
                        text: res.message,
                        duration: 2000, // Set the duration for how long the toast should be displayed
                        gravity: "top-right", // Set the position of the toast (e.g., "top", "bottom", "center")
                        close: true, // Enable the close button on the toast
                        backgroundColor: "#FF0000",

                    }).showToast();
                    return false;
                }
            });
        }
    });
});
function fetchData(data, domain, id) {
    var newTbodyContent = '';
    var newsformlike= "";

    if (Array.isArray(data) && data.length === 0) {
        newsformlike += `
        <div class="col-12 p-5">
                    <h4 class="text-center px4 py-3">Danh sách yêu thích của bạn đang trống !!</h4>
                    <div class="text-center py-2">
                        <a href="/cua-hang" class="btn btn-login text-center w-25 m-auto">Tham quan ngay</a>
                    </div>
                </div>
        `;
        $("#formlike").html(newsformlike);
    }
    else {
        data.forEach(function (product) {
            newTbodyContent += `

        <tr>
        <td><img src="${domain}/public/assets/img/img_pet/${product.image}" alt=""
                width="100"></td>
        <td>${product.product_name}</td>
        <td>${number_format(product.price, 0, ".", ".")} VND</td>
        <td><a  data-like-id=${product.id} class="ri-delete-bin-line delete-product" style="cursor: pointer"></a></td>
    </tr>
      `;
        });
        $(id).html(newTbodyContent);
    }

}

