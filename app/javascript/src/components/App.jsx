import React, {useState, useMemo, useEffect} from 'react'
import {Switch, Route} from "react-router-dom"
import About from './../pages/About'
import Counters from './../pages/Counters'

function App() {

  return (
    <Switch>
        <Route path="/about">
          <About />
        </Route>
        <Route exact path="/counters" component={Counters} />


    </Switch>
  )

}

export default App
