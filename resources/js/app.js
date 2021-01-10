require("./bootstrap");

import Vue from "vue";
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
import locale from "element-ui/lib/locale/lang/en";
import EventScheduler from "./component/EventScheduler";

Vue.use(ElementUI, { locale });

Vue.component("event-scheduler", EventScheduler);

const app = new Vue({
    el: "#root",
});
