document.addEventListener('turbo:load', function() {
    $(document).ready(function() {
        $("tr[data-link]").click(function(event){
            console.log("click")
            window.location.href = $(this).data("link")
            event.preventDefault();
        });
        $("tr[data-link]").css('cursor', 'pointer');
    });
})

document.addEventListener("turbo:load", function() {

    $(".course-reg-field").on('cocoon:after-insert', function () {
        console.log('hit-add');
        HideOrShowAddCourse();
    });

    $(".course-reg-field").on('cocoon:after-remove', function () {
        console.log('hit-remove')
        HideOrShowAddCourse();
    });

    let queries = document.querySelectorAll(".user_row");
    console.log(queries);

    queries.forEach((row) => {
        row.addEventListener('click', function() {
            window.document.location = this.dataset['href'];
        });
    });
})

function HideOrShowAddCourse() {
    addCourseButton = document.getElementById('add-course-button');
    if($(".course-reg-field .nested-fields:visible").length == 4)
        addCourseButton.style.display = 'none';
    else
        addCourseButton.style.display = 'block';
}

function EnableDisableTextBox(ddlModels) {
    let selectedValue = ddlModels.options[ddlModels.selectedIndex].value;
    let txtOther = document.getElementById("txtOther");
    txtOther.disabled = selectedValue == 5 ? false : true;
    if (!txtOther.disabled) {
        txtOther.focus();
    }
}