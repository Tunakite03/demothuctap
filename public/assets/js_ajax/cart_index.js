
$(document).on('click', '.plus-btn', function () {
    // Get the product ID associated with the clicked button
    var cart_id = $(this).closest('tr').find('.quantity-pro').data('cart-id');

    // Create a new FormData object
    var formData = new FormData();
    formData.append('id', cart_id);
    formData.append('quantity', 1);

    _doAjaxNod('POST', formData, 'cart_index', 'index', 'updatequantity', true, (res) => {
        // Call the _doAjaxNod function
        console.log(res);
        if (res.status == 200) {
            var domain = res.data.domain;
            domain = domain.replace(/"/g, '');
            fetchData(res.data.product, domain, "#tbl_data_cart");

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
});

$(document).on('click', '.minus-btn', function () {
    // Get the product ID associated with the clicked button
    var cart_id = $(this).closest('tr').find('.quantity-pro').data('cart-id');
    // Create a new FormData object
    var formData = new FormData();
    formData.append('id', cart_id);
    formData.append('quantity', -1);

    _doAjaxNod('POST', formData, 'cart_index', 'index', 'updatequantity', true, (res) => {
        // Call the _doAjaxNod function
        // console.log(res);
        if (res.status == 200) {
            var domain = res.data.domain;
            domain = domain.replace(/"/g, '');
            fetchData(res.data.product, domain, "#tbl_data_cart");
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
});

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
            var cart_id = $(this).closest('tr').find('.quantity-pro').data('cart-id');
            // Create a new FormData object
            var formData = new FormData();
            formData.append('id', cart_id);

            _doAjaxNod('POST', formData, 'cart_index', 'index', 'deletecart', true, (res) => {
                // Call the _doAjaxNod function

                if (res.status == 200) {
                    var domain = res.data.domain;
                    domain = domain.replace(/"/g, '');
                    fetchData(res.data.product, domain, "#tbl_data_cart");
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
        }
    });
});


function fetchData(data, domain, id) {
    var newTbodyContent = '';

    if (Array.isArray(data) && data.length === 0) {
        newTbodyContent += `
        <div class="col-12 p-5">
        <h4 class="text-center px4 py-3">Giỏ hàng của bạn đang trống !!</h4>
        <div class="text-center py-2">
            <a href="/cua-hang" class="btn btn-login text-center w-25 m-auto">Mua sắm ngay </a>
        </div>
    </div>
        `;
        $('#cart_wrapper').html(newTbodyContent);

        $('#payment_wrapper').html('');
    }
    else {
        data.forEach(function (product) {
            newTbodyContent += `
        <tr>
          <td><img src="${domain}/public/assets/img/img_pet/${product.image}" alt="" width="100"></td>
          <td>${product.name}</td>
          <td>${(product.price * 1).toLocaleString('vi-VN')} VND</td>
          <td>
            <div class="input-group">
              <button type="button" class="btn btn-outline-primary minus-btn">-</button>
              <input type="number" value="${product.quantity}" min="1" style="width: 60px; padding: 0 5px;" 
                class="btn btn-outline-primary quantity-pro outline-none" name="quantity[${product.id}]" 
                disabled data-cart-id="${product.id}">
              <button type="button" class="btn btn-outline-primary plus-btn">+</button>
            </div>
          </td>
          <td>${(product.price * product.quantity).toLocaleString('vi-VN')} VND</td>
          <td><span class="ri-delete-bin-line delete-product"  style="cursor: pointer"> </span>
          </td>
        </tr>
      `;
        });
        $(id).html(newTbodyContent);
    }

}