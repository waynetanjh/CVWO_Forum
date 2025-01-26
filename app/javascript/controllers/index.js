// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application"; // Correct relative path
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"; // Ensure this is installed
import { Application } from "@hotwired/stimulus";
eagerLoadControllersFrom("controllers", application);
