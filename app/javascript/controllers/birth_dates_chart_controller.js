import { Controller } from "@hotwired/stimulus"
import {Chart, registerables } from 'chart.js';
Chart.register(...registerables);

// Connects to data-controller="birth-dates-chart"
export default class BirthDatesChartController extends Controller {
  static ELEMENT_ID = 'birth-years-rates-chart';
  static DEFAULT_OPTIONS = { responsive: true, maintainAspectRatio: false, scales: {
                              y: { ticks: { precision: 0  } } } };

  connect() {
    this.render();
  }

  render() {
    if (!this.ele) return;
    const ctx = this.ele.getContext('2d');
    
    this.graph = new Chart(ctx, { type: 'bar', data: this.data, options: this.options });
  }

  get ele() {
    return this._ele = this._ele || document.getElementById(BirthDatesChartController.ELEMENT_ID);
  }

  get metrics() {
    return this._metrics = this._metrics || JSON.parse(document.querySelector('[data-metrics').dataset.metrics);
  }

  get options() {
    return BirthDatesChartController.DEFAULT_OPTIONS;
  }

  get data() {
    return { labels: this.labels, datasets: this.datasets };
  }

  get labels() {
    return this._labels = this._labels || this.metrics.map((m) => m.year);
  }

  get datasets() {
    return [{
      label: 'Number of patients for a given year',
      data: this.metrics.map((m) => m.count),
      backgroundColor: 'rgba(54, 162, 235, 0.5)',
      borderWidth: 2,
      borderColor: 'black'
    }];

  }

}
