var data = [];
$(document).ready(function () {
    var filterParams = {
        categoryId: '',
        sort: '',
    };

    $(document).on('click', '.cate_click', function () {
        filterParams.categoryId = $(this).find('.sidebar-link').attr('data-cate-id');

        filter(filterParams.categoryId, filterParams.sort);

    });

    $(document).on('click', '.subcate_click', function () {
        filterParams.categoryId = $(this).find('.sidebar-link').attr('data-subcate-id');

        filter(filterParams.categoryId, filterParams.sort);

    });

    $('#select-price').change(function () {
        filterParams.sort = $(this).val();

        filter(filterParams.categoryId, filterParams.sort);

    });
})


function filter(cate_id = "", sort = "") {
    var formData = new FormData();
    formData.append('cate_id', cate_id);
    formData.append('sort', sort);

    _doAjaxNodCustom('POST', formData, 'shop_index', 'index', 'filter', true, (res) => {
        // Call the _doAjaxNod function

        if (res.status == 200) {
            var domain = res.data.domain;
            domain = domain.replace(/"/g, '');

            if (res.data.products.length == 0) {
                $('#show_product').html('<p>Không có sản phẩm nào.</p>');
            } else {
                fetchData(res.data.products, domain, "#show_product");
            }
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
function fetchData(data, domain, id) {
    var newTbodyContent = '';
    data.forEach(function (item) {
        newTbodyContent += `
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product-item">
                    <div class="product-item-pic set-bg">
                        <img src="${domain}/public/assets/img/img_pet/${item.image}" alt=""
                        width="100%">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product-item-text">
                        <h6><a href="/${item.link_url}-id${item.id}"><span>
                            ${item.name}
                        </span></a></h6>
                        <span class="text-secondary me-1">
                            ${item.sale == 1 ?
                            `<h5 style="color:red;">${(item.price * 1).toLocaleString('vi-VN').replace(/,/g, '.')}<sup><u>đ</u></sup></br></h5>` :
                            `<h5><font color="red">${(item.price * (1 - (1 - item.sale))).toLocaleString('vi-VN').replace(/,/g, '.')}<sup><u>đ</u></sup></font>
                            <strike>${(item.price * 1).toLocaleString('vi-VN').replace(/,/g, '.')}</strike><sup><u>đ</u></sup></br></h5>`
                            }
                        </span>
                    </div>
                </div>
            </div>
        `;
    });
    $(id).html(newTbodyContent);
}