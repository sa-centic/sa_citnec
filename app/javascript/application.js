// Entry point for the build script in your package.json
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
import "./controllers"
import * as bootstrap from "bootstrap"
import "./users"
import "./courses"
import "./src/jquery"
import "./src/jquery-ui"
import "@nathanvda/cocoon"

$('a[data-toggle="tooltip"]').tooltip();
import "trix"
import "@rails/actiontext"
