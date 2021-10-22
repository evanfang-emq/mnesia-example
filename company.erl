-module(company).

-include_lib("stdlib/include/qlc.hrl").

-record(employee,
        {emp_no, name, salary, sex, phone, room_no}).

-export([create_schema/1,
         create_table/1,
         get_emp/0,
         insert_emp/0]).

create_schema(Nodes) ->
    ok = mnesia:create_schema(Nodes).

create_table(Nodes) ->
    % application:start(mnesia),
    mnesia:create_table(employee,
                        [{attributes, record_info(fields, employee)},
                         {disc_copies, Nodes}]).

% Insert employee with transaction
insert_emp() ->
    Emp = #employee{emp_no = 104732, name = klacke,
                    salary = 7, sex = male, phone = 98108,
                    room_no = {221, 15}},
    Fun = fun () -> mnesia:write(Emp) end,
    mnesia:transaction(Fun).

get_emp() ->
    EmpNo = 104732,
    F = fun () ->
                Emp = mnesia:read(employee, EmpNo),
                Emp
        end,
    mnesia:transaction(F).
