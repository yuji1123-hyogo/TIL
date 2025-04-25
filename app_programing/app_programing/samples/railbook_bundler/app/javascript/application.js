import React from 'react';
import ReactDOM from 'react-dom/client';
import MyHello from './components/my-hello';

const root = ReactDOM.createRoot(document.querySelector('#app'));
root.render(<MyHello name='佐藤理央' />);
