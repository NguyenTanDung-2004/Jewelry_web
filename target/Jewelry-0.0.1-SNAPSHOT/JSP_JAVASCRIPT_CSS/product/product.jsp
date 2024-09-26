<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home - Expense Management</title>
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/css.css"/>
        <!-- Unicons -->
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/fontawesome.css">
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/brands.css">
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/solid.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    </head>
    <body>
        <div class="logo">
            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/image.png" alt="" style="width: 100px;">
            <p>You & Jewelry</p>
        </div>
    <!--header-->
        <header>
            <div class="left header_child">
                <p>Home</p>
                <p>Product's</p>
                <p>About</p>
            </div>
            <div class="right header_child">
                <div class="user">
                    <img src="https://scontent.xx.fbcdn.net/v/t39.30808-1/434718029_1118394646250167_1887933937683106884_n.jpg?stp=dst-jpg_s480x480&_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeG4A31Lz7YHTKRD3miYbhh93BzFKgXz-uzcHMUqBfP67EUGtRYYJ10-INQHGfr7u8sd9B8TsBWu-tjS37g6oXFa&_nc_ohc=04gxn7sfcIUAb7iX2O-&_nc_ht=scontent.fhan3-3.fna&oh=00_AfCRPz6broXt0CTmTA1bbV1YCGWX-0IV4abmKUsFxtGp1w&oe=661BDB24&_nc_fr=fhan3c03" alt="">
                    <div class="user_hover">
                        <div class="arrow"></div>
                        <div class="content">
                            <p>User Setting</p>
                            <p>Order history</p>
                            <p>Logout</p>
                        </div>
                    </div>
                </div>
                <i class="fa-solid fa-cart-shopping text_child"></i>
            </div>
        </header>
        <main>
            <div class="search">

                <input type="text">
                <div class="line search_child"></div>
                <i class="fa-solid fa-magnifying-glass search_child"></i>
                <div class="result">
                    <i id="close_result" class="fa-solid fa-xmark"></i>
                    <div class="result_scroll">
                        <div class="result1 result_child">
                            <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 50px;" alt="">
                            <div class="text">
                                <p class="name1">LOVE RING</p>
                                <p class="money">19.000.000 VND</p>
                            </div>
                        </div>
                        <div class="result2 result_child">
                            <img src="https://s3-alpha-sig.figma.com/img/e7c8/fb48/fc446102777d4e66ac34408fd0951053?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CRfS5KsoGi--Sb5JWC4C1iUwyCYS7vVdvruaFEHhrX0vKse6pQqyatd1fqO03lYt1PtGjcVOUp7qZpRFEuuty-fH5wWCf3pqG2Rj~YXqjOxdWn-RrBROI6MB3COipJ5HK3uf1mjPCSdGbAFxM3KzRA37Ot1P7oJMzti4P2zE4onRSw~YlMURZwlxRQFZf3qUQNz1V~FkvERhxlFzT-A88NGNWUPko67zKcJhWbzytoXDbSsHtpjv2C6qOcvkzXVBtBkTge-oHv-om~EyUbgHvN30-YJWSjm~RZAf6Zv0SFDRYzFuV2P3mfKP4QHxjhsUFYUZ6AwudRXnY75aZanEeg__" style="height: 50px;" alt="">
                            <div class="text">
                                <p class="name1">LOVE RING</p>
                                <p class="money">19.000.000 VND</p>
                            </div>
                        </div>
                        <div class="result3 result_child">
                            <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 50px;" alt="">
                            <div class="text">
                                <p class="name1">LOVE RING</p>
                                <p class="money">19.000.000 VND</p>
                            </div>
                        </div>
                        <div class="result1 result_child">
                            <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 50px;" alt="">
                            <div class="text">
                                <p class="name1">LOVE RING</p>
                                <p class="money">19.000.000 VND</p>
                            </div>
                        </div>
                        <div class="result1 result_child">
                            <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 50px;" alt="">
                            <div class="text">
                                <p class="name1">LOVE RING</p>
                                <p class="money">19.000.000 VND</p>
                            </div>
                        </div>
                        <div class="result1 result_child">
                            <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 50px;" alt="">
                            <div class="text">
                                <p class="name1">LOVE RING</p>
                                <p class="money">19.000.000 VND</p>
                            </div>
                        </div>
                        <div class="result1 result_child">
                            <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 50px;" alt="">
                            <div class="text">
                                <p class="name1">LOVE RING</p>
                                <p class="money">19.000.000 VND</p>
                            </div>
                        </div>
                        <div class="result1 result_child">
                            <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 50px;" alt="">
                            <div class="text">
                                <p class="name1">LOVE RING</p>
                                <p class="money">19.000.000 VND</p>
                            </div>
                        </div>
                        <div class="result1 result_child">
                            <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 50px;" alt="">
                            <div class="text">
                                <p class="name1">LOVE RING</p>
                                <p class="money">19.000.000 VND</p>
                            </div>
                        </div>
                        <div class="result1 result_child">
                            <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 50px;" alt="">
                            <div class="text">
                                <p class="name1">LOVE RING</p>
                                <p class="money">19.000.000 VND</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="filter_ngang">
                <p id="collection_tab_button">COLLECTIONS</p>
                <p>BRACELETS</p>
                <p>RINGS</p>
                <p>NECKLACES</p>
                <p>EARRINGS</p>
                <p>SALES</p>
            </div>
            <div class="line1">
                <div class="line1_child"></div>
            </div>
            <div class="main_child">
                <div class="title_search">
                    <p class="child">Products</p>
                    <i class="fa-solid fa-chevron-right child"></i>
                    <p class="name">BRACELETS</p>
                </div>
                <div class="line2">
                    <div class="line2_child"></div>
                </div>
                <div class="content">
                    <div class="left">
                        <div class="sort_by left_child">
                            <p class="title">SORT BY</p>
                            <div class="high_to_low left_child_child">
                                <input type="radio" id="checkbox" name="checkbox2" value="checkbox" class="left1">
                                <p>PRICE HIGH TO LOW</p>
                            </div>
                            <div class="low_to_high left_child_child">
                                <input type="radio" id="checkbox" name="checkbox2" value="checkbox" class="left1">
                                <p>PRICE LOW TO HIGH</p>
                            </div>
                        </div>
                        <div class="filter_by left_child">
                            <p class="title">FILTER BY</p>
                            <div class="new_arrival left_child_child">
                                <input type="radio" id="checkbox" name="checkbox" value="checkbox" class="left1">
                                <span class="checkmark"></span>
                                <p>NEW ARRIVALS</p>
                            </div>
                            <div class="try_on left_child_child">
                                <input type="radio" id="checkbox" name="checkbox" value="checkbox" class="left1">
                                <span class="checkmark"></span>
                                <p>TRY ON</p>
                            </div>
                        </div>
                        <div class="categories left_child">
                            <p class="title">CATEGORIES</p>
                            <div class="bracelet left_child_child">
                                <input type="radio" id="checkbox" name="checkbox1" value="checkbox" class="left1">
                                <span class="checkmark"></span>
                                <p>BRACELETS</p>
                            </div>
                            <div class="ring left_child_child">
                                <input type="radio" id="checkbox" name="checkbox1" value="checkbox" class="left1">
                                <span class="checkmark"></span>
                                <p>RINGS</p>
                            </div>
                            <div class="necklace left_child_child">
                                <input type="radio" id="checkbox" name="checkbox1" value="checkbox" class="left1">
                                <span class="checkmark"></span>
                                <p>NECKLACES</p>
                            </div>
                            <div class="earring left_child_child">
                                <input type="radio" id="checkbox" name="checkbox1" value="checkbox" class="left1">
                                <span class="checkmark"></span>
                                <p>EARRINGS</p>
                            </div>
                        </div>
                    </div>
                    <div class="right">
                        <p id="so_luong_product">150 product</p>
                        <div class="sanpham_cha">
                            <div class="sanpham">
                                <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 200px;" alt="">
                                <div class="content1">
                                    <p class="name1">LOVE RING</p>
                                    <p class="money">19.000.000 VND</p>
                                </div>
                            </div>
                            <div class="sanpham">
                                <img src="https://s3-alpha-sig.figma.com/img/e7c8/fb48/fc446102777d4e66ac34408fd0951053?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CRfS5KsoGi--Sb5JWC4C1iUwyCYS7vVdvruaFEHhrX0vKse6pQqyatd1fqO03lYt1PtGjcVOUp7qZpRFEuuty-fH5wWCf3pqG2Rj~YXqjOxdWn-RrBROI6MB3COipJ5HK3uf1mjPCSdGbAFxM3KzRA37Ot1P7oJMzti4P2zE4onRSw~YlMURZwlxRQFZf3qUQNz1V~FkvERhxlFzT-A88NGNWUPko67zKcJhWbzytoXDbSsHtpjv2C6qOcvkzXVBtBkTge-oHv-om~EyUbgHvN30-YJWSjm~RZAf6Zv0SFDRYzFuV2P3mfKP4QHxjhsUFYUZ6AwudRXnY75aZanEeg__" style="height: 200px;" alt="">
                                <div class="content1">
                                    <p class="name1">LOVE RING</p>
                                    <p class="money">19.000.000 VND</p>
                                </div>
                            </div>
                            <div class="sanpham">
                                <img src="https://s3-alpha-sig.figma.com/img/490f/2ca3/2caac319c7cd029ea74320d9ded152a5?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FG~qBiPyXla4awabopseUh9fFAFb1vNazt8okT-IIDou4MzfILsHus1tjiv1Vqq0QXkvKFdS32-OO36IHVCTQOL3awtUYB2ZUMkjn05n-znqpWPUzM1l1h5OasABybY5~f79f4RbsEBjAZqgG1vrxNx5h2Vz9fry959mBH28CLCYLPmwdZrZgf3XM27gzPyZJ0WuJ8fwGQHMqiF180FOkxDsSI-BrOW58zBCy-q5KC384sxs-cp1iv0gQKGgP3KaLyUlW~xeRD0-9kO~6SWgPhMGgg~sf6F5Kg54h3BFKhEfRZjt5EDKafApFf2fJOcTQSC4ZBUlQXDhgmmMhbGzNA__" style="height: 200px;" alt="">
                                <div class="content1">
                                    <p class="name1">LOVE RING</p>
                                    <p class="money">19.000.000 VND</p>
                                </div>
                            </div>
                            <div class="sanpham">
                                <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 200px;" alt="">
                                <div class="content1">
                                    <p class="name1">LOVE RING</p>
                                    <p class="money">19.000.000 VND</p>
                                </div>
                            </div>
                            <div class="sanpham">
                                <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 200px;" alt="">
                                <div class="content1">
                                    <p class="name1">LOVE RING</p>
                                    <p class="money">19.000.000 VND</p>
                                </div>
                            </div>
                            <div class="sanpham">
                                <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=a8UEjCKQy5Et3XyIheKR1tsu6TMmgGe~fp6dHMmW51RPxbvYA8ZYNh110O5~WFZiEcKyKdhcm1aBFQ~qFVdfoP1~WwT2s8hMK8GmNWGRPHbVHYBaVRbtQAT3NGIKlNIwKfY~fuO~oypxjD6laXmu6x5DSwGoVgMESA54proHTkVwHx8uy6ctwk8W6zB6J0aEDxQSPuQ0jAQJxTH3xM-jXknKOeuS4NiU5ivSkgfV1x-uCMQHbXcpMHSK~LhzDyhI64N7KkMqnosNij2HqZkFBzZbnmS2zm0dxYqQzrbyzZ4Jz2Tx6-w~E5fwoOqwHEKeLk46vUVXs5OK211UE7UAcg__" style="height: 200px;" alt="">
                                <div class="content1">
                                    <p class="name1">LOVE RING</p>
                                    <p class="money">19.000.000 VND</p>
                                </div>
                            </div>
                            <div class="sanpham">
                                <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 200px;" alt="">
                                <div class="content1">
                                    <p class="name1">LOVE RING</p>
                                    <p class="money">19.000.000 VND</p>
                                </div>
                            </div>
                            <div class="sanpham">
                                <img src="https://s3-alpha-sig.figma.com/img/3624/d206/767d14a51d839fb9e4b98d86b712e8b0?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~djJ1-u0f2nVwjkXjYE2X7NCbRA4aQMhe6PQzSJZ8hqHmlL7ZKO9L~18rXg~yKYzUzoqA5msfpAIv5cCBudtFWZUz8nKPBtJ0hm44CQTRXGUpeBq0V9dsLGyaZh2zGwhVroFcEsD3pmVnzdgpy63w3CUmEKnB8ojh~RRnb5szDdPV2pVHn2xKUpQv-7XeeWZSYYWGGM3WjBQAVDbMYapQ6EFkqRT8Ydkqyg-OQKzqwYAgBbdfo4VWOXVgy2n3z6y8ksYlQl0Mox0-6kL4rRF4D4jnb-ty8daultE5qrtDd9xpaH~9RYmWXtK~XpXxiRc61ozyKjqqx~WGSgprLDqA__" style="height: 200px;" alt="">
                                <div class="content1">
                                    <p class="name1">LOVE RING</p>
                                    <p class="money">19.000.000 VND</p>
                                </div>
                            </div>
                        </div>
                        <div class="loadmore">
                              <p>Showing 24 of 123 items</p>
                              <button>LOAD MORE</button>  
                        </div>
                    </div>
            </div>
            </div>
        </main>
        <!--phần dưới đây dùng để hiển thị collection-->
        <div class="collections">
            <div class="products">
                <div class="product1 product_child">
                    <img src="https://s3-alpha-sig.figma.com/img/8448/0edb/a452af78c564964b9c16875541b3f1de?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cX3qKgxIRyDZQ7~WcccnOGamtFeNk7nRPpQ6ofXr-FMhaSHspXSBN9wc02FZlvW8N~azUtMFeUZkKaOvN-FJ4gLRKMNhLCIZOT4GQsRiTZUNuJ4Anfq9dVten6HwTyd7O5hBVINzAlPLBA8u8z6TB1-TNBVavi3NPMmqoa3QfOOouop073KTzgC8m9CgxfU8Fk6~wS8Mc2hBDpsZy3BNiZF7dDnL7ovSedZbrOJ-cVCYWZhK9OkIjNFs4WHtZi76u3T5brfUkUOKVvTHj-utJcWNjCWVvcA~S1SjGSbuvcFB-z7Q7-3KKgReghx7~POd7Nbi5fdueyTKi1BIByzGVA__" style="height: 150px;" alt="">
                    <p>SPRING</p>
                </div>
                <div class="product2 product_child">
                    <img src="https://s3-alpha-sig.figma.com/img/8448/0edb/a452af78c564964b9c16875541b3f1de?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cX3qKgxIRyDZQ7~WcccnOGamtFeNk7nRPpQ6ofXr-FMhaSHspXSBN9wc02FZlvW8N~azUtMFeUZkKaOvN-FJ4gLRKMNhLCIZOT4GQsRiTZUNuJ4Anfq9dVten6HwTyd7O5hBVINzAlPLBA8u8z6TB1-TNBVavi3NPMmqoa3QfOOouop073KTzgC8m9CgxfU8Fk6~wS8Mc2hBDpsZy3BNiZF7dDnL7ovSedZbrOJ-cVCYWZhK9OkIjNFs4WHtZi76u3T5brfUkUOKVvTHj-utJcWNjCWVvcA~S1SjGSbuvcFB-z7Q7-3KKgReghx7~POd7Nbi5fdueyTKi1BIByzGVA__" style="height: 150px;" alt="">
                    <p>SPRING</p>
                </div>
                <div class="product3 product_child">
                    <img src="https://s3-alpha-sig.figma.com/img/8448/0edb/a452af78c564964b9c16875541b3f1de?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cX3qKgxIRyDZQ7~WcccnOGamtFeNk7nRPpQ6ofXr-FMhaSHspXSBN9wc02FZlvW8N~azUtMFeUZkKaOvN-FJ4gLRKMNhLCIZOT4GQsRiTZUNuJ4Anfq9dVten6HwTyd7O5hBVINzAlPLBA8u8z6TB1-TNBVavi3NPMmqoa3QfOOouop073KTzgC8m9CgxfU8Fk6~wS8Mc2hBDpsZy3BNiZF7dDnL7ovSedZbrOJ-cVCYWZhK9OkIjNFs4WHtZi76u3T5brfUkUOKVvTHj-utJcWNjCWVvcA~S1SjGSbuvcFB-z7Q7-3KKgReghx7~POd7Nbi5fdueyTKi1BIByzGVA__" style="height: 150px;" alt="">
                    <p>SPRING</p>
                </div>
                <div class="product4 product_child">
                    <img src="https://s3-alpha-sig.figma.com/img/8448/0edb/a452af78c564964b9c16875541b3f1de?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cX3qKgxIRyDZQ7~WcccnOGamtFeNk7nRPpQ6ofXr-FMhaSHspXSBN9wc02FZlvW8N~azUtMFeUZkKaOvN-FJ4gLRKMNhLCIZOT4GQsRiTZUNuJ4Anfq9dVten6HwTyd7O5hBVINzAlPLBA8u8z6TB1-TNBVavi3NPMmqoa3QfOOouop073KTzgC8m9CgxfU8Fk6~wS8Mc2hBDpsZy3BNiZF7dDnL7ovSedZbrOJ-cVCYWZhK9OkIjNFs4WHtZi76u3T5brfUkUOKVvTHj-utJcWNjCWVvcA~S1SjGSbuvcFB-z7Q7-3KKgReghx7~POd7Nbi5fdueyTKi1BIByzGVA__" style="height: 150px;" alt="">
                    <p>SPRING</p>
                </div>
                <div class="product5 product_child">
                    <img src="https://s3-alpha-sig.figma.com/img/8448/0edb/a452af78c564964b9c16875541b3f1de?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cX3qKgxIRyDZQ7~WcccnOGamtFeNk7nRPpQ6ofXr-FMhaSHspXSBN9wc02FZlvW8N~azUtMFeUZkKaOvN-FJ4gLRKMNhLCIZOT4GQsRiTZUNuJ4Anfq9dVten6HwTyd7O5hBVINzAlPLBA8u8z6TB1-TNBVavi3NPMmqoa3QfOOouop073KTzgC8m9CgxfU8Fk6~wS8Mc2hBDpsZy3BNiZF7dDnL7ovSedZbrOJ-cVCYWZhK9OkIjNFs4WHtZi76u3T5brfUkUOKVvTHj-utJcWNjCWVvcA~S1SjGSbuvcFB-z7Q7-3KKgReghx7~POd7Nbi5fdueyTKi1BIByzGVA__" style="height: 150px;" alt="">
                    <p>SPRING</p>
                </div>
            </div>
            <div class="line">
                <div class="line_child"></div>
            </div>
            <div class="text">
                <p class="top">CHOOSE YOUR UNIQUE STYLE</p>
                <p class="bottom">AND EXPRESS YOURSELF</p>
            </div>
        </div>
        <footer>
            <div class="footer">
                <div class="main">
                    <div class="location main_child">
                        <div class="top3">Location</div>
                        <div class="bottom3">
                            <i class="fa-solid fa-location-dot"></i>
                            <p>UIT - University Information Of Technology.</p>
                        </div>
                    </div>
                    <div class="About_us main_child">
                        <div class="top3">About Us</div>
                        <div class="bottom3">
                            <p>Nguyễn Tấn Dũng</p>
                            <p>Phan Nguyễn Trà Giang</p>
                            <p>Vũ Hồ Quỳnh Anh</p>
                            <p>Nguyễn Văn Duy Bảo</p>
                        </div>
                    </div>
                    <div class="hotlline main_child">
                        <div class="top3">Hotline</div>
                        <div class="bottom3">Timo - 0977482071</div>
                    </div>
                    <div class="subcribe main_child">
                        <div class="top3">Subcribe Newletter</div>
                        <div class="bottom3">
                            <input type="email" placeholder="Your Email:">
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                </div>
                <div class="line_copyright">
                    <div class="line"></div>
                    <p>@copyright</p>
                </div>
            </div>
        </footer>
    <!--main-->
    <script src="../product/product.js"></script>
    </body>
</html>