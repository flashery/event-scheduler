<template>
	<div>
		<el-form :model="current_event" label-width="120px" class="form">
			<div class="block">
				<span v-html="error" style="color: red"></span>
			</div>
			<div class="block">
				<span>Event Name</span>
				<el-input
					placeholder="Please input event name"
					v-model="current_event.name"
				></el-input>
			</div>
			<div class="block">
				<span>Date Range</span>
				<el-date-picker
					v-model="current_event.date"
					type="daterange"
					range-separator="To"
					start-placeholder="Start date"
					end-placeholder="End date"
				>
				</el-date-picker>
			</div>
			<div class="block">
				<span>Select Days</span>
			</div>

			<div class="checkbox" v-for="(interval, index) in intervals" :key="index">
				<input
					type="checkbox"
					v-model="current_event.interval"
					:value="interval"
				/>
				{{ interval }}
			</div>
			<el-button type="primary" @click="addEvent">Add Event</el-button>
		</el-form>

		<div class="calendar">
			<div class="month" v-for="(month, index) in calendar" :key="index">
				{{ month.month }}
				<table class="day_table">
					<tr v-for="(day, day_index) in month.days" :key="day_index">
						<td>{{ `${day.day_of_month} ${day.day_of_week}` }}</td>
						<td>
							<span v-for="(day_event, index3) in day.day_events" :key="index3">
								{{ day_event }},
							</span>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</template>
<script>
import {
	format,
	eachMonthOfInterval,
	eachDayOfInterval,
	endOfMonth,
	startOfMonth,
	isBefore,
	isAfter,
	isEqual,
} from "date-fns";

import axios from "axios";

export default {
	props: {
		data: {
			type: Object,
		},
	},
	data() {
		return {
			intervals: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
			current_event: {
				date: [],
				interval: ["Mon", "Tue", "Fri"],
				name: "Test Event",
			},
			events: [],
			start_date: new Date("2020-01-01"),
			end_date: new Date(),
			calendar: [],
			error: "",
		};
	},

	methods: {
		createCalendar() {
			const datas = [];

			eachMonthOfInterval({
				start: this.start_date,
				end: this.end_date,
			}).forEach((month) => {
				const days = [];

				const start_month = startOfMonth(month);
				const end_month = endOfMonth(month);

				eachDayOfInterval({ start: start_month, end: end_month }).forEach(
					(day) => {
						const day_events = [];

						this.events.forEach((event) => {
							if (
								(isAfter(day, new Date(event.date[0])) &&
									isBefore(day, new Date(event.date[1]))) ||
								isEqual(day, new Date(event.date[0])) ||
								isEqual(day, new Date(event.date[1]))
							) {
								console.log(day);
								if (event.interval.includes(format(day, "EEE")))
									day_events.push(event.name);
							}
						});

						days.push({
							day_of_month: format(day, "d"),
							day_of_week: format(day, "EEE"),
							day_events,
						});
					}
				);

				datas.push({
					month: format(month, "MMM yyyy"),
					days: days.reverse(),
				});
			});
			this.calendar = datas.reverse();
		},
		async addEvent(e) {
			e.preventDefault();
			if (this.validate() === false) return;
			await this.saveToDB();
			this.events.push(JSON.parse(JSON.stringify(this.current_event)));
			this.createCalendar();
		},
		async saveToDB() {
			await axios.post("/event", {
				name: this.current_event.name,
				interval: this.current_event.interval,
				start: format(this.current_event.date[0], "yyyy-MM-dd HH:mm:ss"),
				end: format(this.current_event.date[1], "yyyy-MM-dd HH:mm:ss"),
			});
		},
		validate() {
			this.error = "";
			if (
				!this.current_event.interval ||
				this.current_event.interval.length === 0
			) {
				this.error += "* Please select specified days for this event <br/>";
			}
			if (!this.current_event.date || this.current_event.date.length === 0) {
				this.error += "* Please select date range <br/>";
			}
			if (!this.current_event.name || this.current_event.name === "") {
				this.error += "* Please input event name <br/>";
			}

			if (this.error !== "") return false;

			return true;
		},
	},
	mounted() {
		this.createCalendar();
	},
};
</script>
<style scoped>
.checkbox {
	display: inline;
}
.form {
	float: left;
	padding: 20px;
	width: 30%;
}
.calendar {
	width: 70%;
	float: left;
}
table.day_table {
	width: 100%;
}
table.day_table tr:nth-child(even) {
	font-size: 12px;
	background-color: #cccccc;
}
table.day_table tr:nth-child(odd) {
	font-size: 12px;
	background-color: #f3f3f3;
}
</style>

