// {
//     const target = document.getElementById("color").value;
//     const dataElem = document.getElementById("data");
//
//     function selColor() {
//         const iboard = dataElem.dataset.iboard;
//         myFetch.get(`/color/${iboard}`, setColorList);
//     }
//
//     const setColorList = (list) => {
//         const colorListElem = document.querySelector('#select_color');
//
//         const table = makeTable();
//         colorListElem.appendChild(table);
//
//         list.forEach(item => {
//             const tr = makeTr(item);
//             table.appendChild(tr);
//         });
//     }
//
//     const makeTable = () => {
//         const table = document.createElement('table');
//         table.innerHTML = `
//             <tr>
//                 <th>컬러</th>
//                 <th>스몰</th>
//                 <th>미디움</th>
//                 <th>라지</th>
//                 <th>엑스라지</th>
//             </tr>`;
//         return table;
//     }
//     const makeTr = item => {
//         const tr = document.createElement('tr');
//         tr.innerHTML = `
//                 <td>${item.color}</td>
//                 <td>${item.sm}</td>
//                 <td>${item.md}</td>
//                 <td>${item.lg}</td>
//                 <td>${item.xl}</td>
//             `;
//         const td = document.createElement('td');
//         tr.appendChild(td);
//         return tr;
//     }
//
// }
//
