<?php

$x=$data['pages'][0][0]['content'];
echo call_user_func_array($x, []);

    ?>
<section id="page-content">
    <div class="container">
        <!-- post content -->

        <!-- Page title -->
        <!-- end: Page title -->

        <!-- Blog -->
        <div id="blog" class="grid-layout post-3-columns m-b-30" data-item="post-item">

            <?php echo newsGenerator();?>


        </div>
        <!-- end: Blog -->

        <!-- Pagination -->
        <div class="pagination pagination-simple">
            <ul>
                <li>
                    <a href="#" aria-label="Previous">
                            <span aria-hidden="true">
                                <i class="fa fa-angle-left"></i>
                            </span>
                    </a>
                </li>
                <li>
                    <a href="#">1</a>
                </li>
                <li>
                    <a href="#">2</a>
                </li>
                <li class="active">
                    <a href="#">3</a>
                </li>
                <li>
                    <a href="#">4</a>
                </li>
                <li>
                    <a href="#">5</a>
                </li>
                <li>
                    <a href="#" aria-label="Next">
                            <span aria-hidden="true">
                                <i class="fa fa-angle-right"></i>
                            </span>
                    </a>
                </li>
            </ul>
        </div>
        <!-- end: Pagination -->

    </div>
    <!-- end: post content -->

</section>