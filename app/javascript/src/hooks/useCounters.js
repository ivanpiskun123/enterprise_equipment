import {useMemo} from 'react'

export  const useSortedCounters = (counters, sort) => {
  const sortedCounters = useMemo( ()=>{
    if(sort){
      if(sort.localeCompare("value")){
        return (   [...counters].sort( (a,b)=> a[sort].localeCompare(b[sort]) ))
      }
      return (   [...counters].sort(  (a,b) => (a.value > b.value) ? 1 : ((b.value > a.value) ? -1 : 0)    )   )
    }
    return counters
  },[sort, counters])

  return sortedCounters;
}

const useCounters = (counters, query, sort) => {
  const sortedCounters = useSortedCounters(counters, sort);

  const sortedAndCearchedCounters = useMemo( ()=>{
      return sortedCounters.filter( c => c.title.toLowerCase().includes(query.toLowerCase()) )
  },[sortedCounters, query] )

  return sortedAndCearchedCounters
}

export default useCounters
