import React from 'react'

const MySelect = ({options, defaultValue, onChange, value }) => {

  return (
    <select value={value} onChange={ event => onChange(event.target.value) } >
      <option value="" disabled>{defaultValue}</option>
      {
        options.map(option =>
          <option key={option.value}  value={option.value} >{option.name}</option>
        )
      }
    </select>
  )

}

export default MySelect
