// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
Turbo.session.drive = false
import "./controllers"
import * as bootstrap from "bootstrap"
import "./users"
import "./src/jquery"
import "./src/jquery-ui"





$('input[type=radio][name="user[role_ids]"]').change(function() {
    console.log(this.value)

    if ( this.value == 4) {
        console.log("kursistliste");
        $('#courseholder-dropdown').removeClass('d-none');

    }

    else {
        $('#courseholder-dropdown').addClass('d-none');
        $('select').val('');
    }
});