import React from 'react';
import _ from 'lodash';

import BaseComponent from '../../../../libs/components/BaseComponent';

export default class Choice extends BaseComponent {

  constructor(props, context) {
    super(props, context);

    this.state = {
      availableOptions: this.props.options.toJS(),
      selectedOptions: []
    };

    _.bindAll(this, ['_select', '_deSelect']);
  }

  _select(e) {
    let choice = e.target.innerHTML
    if (this.state.selectedOptions.length < this.props.limit &&
      _.includes(this.state.availableOptions, choice)) {

      this.setState({
        availableOptions: _.without(this.state.availableOptions, choice),
        selectedOptions: _.concat(this.state.selectedOptions, choice)
      });
    }
  }

  _deSelect(e) {
    let choice = e.target.innerHTML
    if (_.includes(this.state.selectedOptions, choice)) {
      this.setState({
        selectedOptions: _.without(this.state.selectedOptions, choice),
        availableOptions: _.sortBy(_.concat(this.state.availableOptions, choice))
      });
    }

  }


  render() {
    return (
      <div>
        <div className="selected-skills">
          { this.state.selectedOptions.map((choice) => {
            return (<span key={choice} onClick={this._deSelect}>{choice}</span>);
          })}
        </div>
        <hr />
        <button>Submit</button>
        <div>
          { this.state.availableOptions.map((choice) => {
            return (<div key={choice} onClick={this._select}>{choice}</div>);
          })}
        </div>
      </div>
    );
  }
}