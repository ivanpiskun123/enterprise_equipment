import React from 'react'
import Counter from './Counter'

const CountersList = ( {remove, counters, changeValue} ) => {

  if(! counters.length)
  {
    return(

        <h1>Счетчики не были найдены</h1>
    )
  }


  return (
    <div>
    <h1>Counters list</h1>
            {
              counters.map( (counter) =>
              (
                <Counter remove={remove} counter = {counter} key={counter.id} changeValue={changeValue} />
              )
             )
           }
   </div>
  )

}

export default CountersList
