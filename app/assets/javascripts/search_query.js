$( document ).ready(function() {
    var searchValue = $('#query').val();
    $(function () {
        temp=$("#query").val();
        $("#query").val('');
        $("#query").val(temp);
        $('#query').focus();
        setTimeout(checkSearchChanged, 1.0);
    });

    function checkSearchChanged() {
        var currentValue = $('#query').val();
        if ((currentValue) && currentValue != searchValue && currentValue != '') {
            searchValue = $('#query').val();
            $('#search').click();
        }
        else {
            setTimeout(checkSearchChanged, 1.0);
        }
    }
});
