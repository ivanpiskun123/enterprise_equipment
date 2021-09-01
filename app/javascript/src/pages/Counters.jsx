import React, {useState, useMemo, useEffect} from 'react'

import CountersList from './../components/CountersList'
import CounterForm from './../components/CounterForm'
import CountersFilter from './../components/CountersFilter'
import useCounters from './../hooks/useCounters'
import useFetching from './../hooks/useFetching'
import CountersService from './../API/CountersService'
import Loader from './../components/UI/Loader/Loader'


function Counters() {

    const [counters, setCounters] = useState([])
    const [filter, setFilter] = useState( {sort: '', query: '' } )
    const [fetchCounters, isCountersLoading, countersError] = useFetching(async () => {
      const countersAttr = await CountersService.getAll()
      setCounters( (countersAttr.map( counterData =>
        counterData.attributes
      )))
    })

    const sortedAndCearchedCounters = useCounters(counters, filter.query, filter.sort)

    const createCounter = (newCounter) => {
        setCounters([...counters, newCounter])
    }

    const removeCounter = (counter) => {
        setCounters( counters.filter( c => c.id !== counter.id  )  )
    }

    const changeValue = (newValue, id) => {
        let newCounters = counters
        let counterIdx = newCounters.findIndex( (c) => c.id==id )
        newCounters[counterIdx].value = newValue
        setCounters(newCounters)
    }

    useEffect( ()=>{
      fetchCounters()
    }
    ,[])


    return (
        <div>
          <button onClick={fetchCounters}>Get counters</button>
          <CounterForm create={createCounter} />
          <hr/>
          <CountersFilter filter={filter}  setFilter={setFilter}/>
          {
            countersError && <h1>Произошла ошибка {countersError}</h1>
          }
          {isCountersLoading ?
            <Loader />
            :   <CountersList remove={removeCounter} counters={sortedAndCearchedCounters} changeValue={changeValue} />
          }

        </div>
    )

}

export default Counters
