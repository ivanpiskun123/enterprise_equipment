import React from 'react'
import MySelect from './UI/select/MySelect'


const CountersFilter = ({filter, setFilter})=>{

  return (
    <div>
    <input placeholder="Поиск..."  value={filter.query}
        onChange={e=>setFilter( {...filter, query: e.target.value} ) }
        />
      <MySelect
      value={filter.sort}
      onChange={selectedSort => setFilter( {...filter, sort: selectedSort} ) }
          defaultValue="Сортировка"
          options={[
            {value: "value", name: "По значению"},
            {value: "title", name: "По названию"}
          ]}
      />
      </div>
  )

}

export default CountersFilter
