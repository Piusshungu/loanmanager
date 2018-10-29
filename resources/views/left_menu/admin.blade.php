<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <i class="fa fa-user" style="font-size: 60px"></i>
            </div>
            <div class="pull-left info">
                <p>{{ Sentinel::getUser()->first_name }} {{ Sentinel::getUser()->last_name }}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            @if(!empty(\App\Models\Branch::find(session('branch_id'))))
                <li class=" @if(Request::is('branch/*')) active @endif">
                    <a href="{{ url('branch/change') }}" title="Click to change Branch">
                        <i class="fa fa-check"></i> <span
                                style="text-transform: uppercase">{{\App\Models\Branch::find(session('branch_id'))->name }}</span>
                    </a>
                </li>
            @endif
            <li class="@if(Request::is('dashboard')) active @endif">
                <a href="{{ url('dashboard') }}">
                    <i class="fa fa-dashboard"></i> <span>{{trans_choice('general.dashboard',1)}}</span>
                </a>
            </li>
            @if(Sentinel::hasAccess('branches'))
                <li class="treeview @if(Request::is('branch/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-briefcase"></i> <span>{{trans_choice('general.branch',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('branches.view'))
                            <li><a href="{{ url('branch/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',1)}} {{trans_choice('general.branch',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('branches.create'))
                            <li><a href="{{ url('branch/create') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.add',1)}} {{trans_choice('general.branch',1)}}
                                </a></li>
                        @endif
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('borrowers'))
                <li class="treeview @if(Request::is('borrower/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-users"></i> <span>{{trans_choice('general.borrower',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('borrowers.view'))
                            <li><a href="{{ url('borrower/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',1)}} {{trans_choice('general.borrower',2)}}
                                </a></li>
                            <li>
                                <a href="{{ url('borrower/pending') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.borrower',2)}} {{trans_choice('general.pending',1)}}
                                    <span class="pull-right-container">
                                        <span class="label label-danger pull-right">{{\App\Models\Borrower::where('branch_id', session('branch_id'))->where('active',0)->count() }}</span>
                                    </span>
                                </a>
                            </li>
                        @endif
                        @if(Sentinel::hasAccess('borrowers.create'))
                            <li><a href="{{ url('borrower/create') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.add',1)}} {{trans_choice('general.borrower',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('borrowers.groups'))
                            <li><a href="{{ url('borrower/group/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',1)}} {{trans_choice('general.borrower',1)}} {{trans_choice('general.group',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('borrowers.groups'))
                            <li><a href="{{ url('borrower/group/create') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.add',1)}} {{trans_choice('general.borrower',1)}} {{trans_choice('general.group',1)}}
                                </a></li>
                        @endif
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('loans'))
                <li class="treeview @if(Request::is('loan/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-money"></i> <span>{{trans_choice('general.loan',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('loans.view'))
                            <li><a href="{{ url('loan/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',2)}} {{trans_choice('general.all',2)}} {{trans_choice('general.loan',2)}}
                                    <span class="pull-right-container">
                                        <span class="label label-info pull-right">{{\App\Models\Loan::where('branch_id', session('branch_id'))->count() }}</span>
                                    </span>
                                </a></li>
                            <li>
                                <a href="{{ url('loan/data?status=pending') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.pending',1)}} {{trans_choice('general.approval',1)}}
                                    <span class="pull-right-container">
                                        <span class="label label-warning pull-right">{{\App\Models\Loan::where('branch_id', session('branch_id'))->where('status','pending')->count() }}</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="{{ url('loan/data?status=approved') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.awaiting',1)}} {{trans_choice('general.disbursement',1)}}
                                    <span class="pull-right-container">
                                        <span class="label label-success pull-right">{{\App\Models\Loan::where('branch_id', session('branch_id'))->where('status','approved')->count() }}</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="{{ url('loan/data?status=declined') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.loan',2)}} {{trans_choice('general.declined',1)}}
                                    <span class="pull-right-container">
                                        <span class="label label-danger pull-right">{{\App\Models\Loan::where('branch_id', session('branch_id'))->where('status','declined')->count() }}</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="{{ url('loan/data?status=withdrawn') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.loan',2)}} {{trans_choice('general.withdrawn',1)}}
                                    <span class="pull-right-container">
                                        <span class="label label-danger pull-right">{{\App\Models\Loan::where('branch_id', session('branch_id'))->where('status','withdrawn')->count() }}</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="{{ url('loan/data?status=written_off') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.loan',2)}} {{trans_choice('general.written_off',1)}}
                                    <span class="pull-right-container">
                                        <span class="label label-danger pull-right">{{\App\Models\Loan::where('branch_id', session('branch_id'))->where('status','written_off')->count() }}</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="{{ url('loan/data?status=closed') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.loan',2)}} {{trans_choice('general.closed',1)}}
                                    <span class="pull-right-container">
                                        <span class="label label-success pull-right">{{\App\Models\Loan::where('branch_id', session('branch_id'))->where('status','closed')->count() }}</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="{{ url('loan/data?status=pending_reschedule') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.pending',2)}} {{trans_choice('general.reschedule',1)}}
                                    <span class="pull-right-container">
                                        <span class="label label-warning pull-right">{{\App\Models\Loan::where('branch_id', session('branch_id'))->where('status','pending_reschedule')->count() }}</span>
                                    </span>
                                </a>
                            </li>
                        @endif
                        @if(Sentinel::hasAccess('loans.create'))
                            <li><a href="{{ url('loan/create') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.add',2)}} {{trans_choice('general.loan',1)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('loans.update'))
                            <li><a href="{{ url('loan/loan_application/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',1)}} {{trans_choice('general.application',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('loans.products'))
                            <li><a href="{{ url('loan/loan_product/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',1)}} {{trans_choice('general.loan',1)}} {{trans_choice('general.product',2)}}
                                </a></li>@endif
                        @if(Sentinel::hasAccess('loans.fees'))
                            <li><a href="{{ url('loan/loan_fee/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',1)}} {{trans_choice('general.loan',1)}} {{trans_choice('general.fee',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('loans.update'))
                            <li><a href="{{ url('loan/loan_disbursed_by/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',1)}} {{trans_choice('general.disbursed_by',1)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('loans.update'))
                            <li><a href="{{ url('loan/loan_repayment_method/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',1)}} {{trans_choice('general.repayment',1)}} {{trans_choice('general.method',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('loans.update'))
                            <li><a href="{{ url('loan/provision/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',1)}} {{trans_choice('general.provision',1)}} {{trans_choice('general.rate',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('loans.loan_calculator'))
                            <li><a href="{{ url('loan/loan_calculator/create') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.loan',1)}} {{trans_choice('general.calculator',1)}}
                                </a></li>
                        @endif
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('repayments'))
                <li class="treeview @if(Request::is('repayment/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-dollar"></i> <span>{{trans_choice('general.repayment',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('repayments.view'))
                            <li><a href="{{ url('repayment/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.repayment',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('repayments.create'))
                            <li><a href="{{ url('repayment/bulk/create') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.add',2)}} {{trans_choice('general.bulk',1)}} {{trans_choice('general.repayment',2)}}
                                </a></li>
                        @endif

                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('savings'))
                <li class="treeview @if(Request::is('saving/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-bank"></i> <span>{{trans_choice('general.saving',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('savings.view'))
                            <li><a href="{{ url('saving/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',2)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.account',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('savings.create'))
                            <li><a href="{{ url('saving/create') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.add',2)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.account',1)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('savings.view'))
                            <li><a href="{{ url('saving/savings_transaction/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',2)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.transaction',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('savings.products'))
                            <li><a href="{{ url('saving/savings_product/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',2)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.product',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('savings.fees'))
                            <li><a href="{{ url('saving/savings_fee/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',2)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.fee',2)}}
                                </a></li>
                        @endif

                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('settings'))
                <li class="treeview @if(Request::is('capital/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-bookmark"></i> <span>{{trans_choice('general.capital',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('settings'))
                            <li><a href="{{ url('capital/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.capital',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('settings'))
                            <li><a href="{{ url('capital/bank/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',2)}} {{trans_choice('general.bank',1)}} {{trans_choice('general.account',2)}}
                                </a></li>
                        @endif

                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('payroll'))
                <li class="treeview @if(Request::is('payroll/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-paypal"></i> <span>{{trans_choice('general.payroll',1)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('payroll.view'))
                            <li><a href="{{ url('payroll/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',2)}} {{trans_choice('general.payroll',1)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('payroll.create'))
                            <li><a href="{{ url('payroll/create') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.add',1)}} {{trans_choice('general.payroll',1)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('payroll.update'))
                            <li><a href="{{ url('payroll/template') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',1)}} {{trans_choice('general.payroll',1)}} {{trans_choice('general.template',2)}}
                                </a></li>
                        @endif
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('expenses'))
                <li class="treeview @if(Request::is('expense/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-share"></i> <span>{{trans_choice('general.expense',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('expenses.view'))
                            <li><a href="{{ url('expense/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',1)}} {{trans_choice('general.expense',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('expenses.create'))
                            <li><a href="{{ url('expense/create') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.add',2)}} {{trans_choice('general.expense',1)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('expenses.create'))
                            <li><a href="{{ url('expense/type/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',2)}} {{trans_choice('general.expense',1)}} {{trans_choice('general.type',2)}}
                                </a></li>
                        @endif
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('other_income'))
                <li class="treeview @if(Request::is('other_income/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-plus"></i> <span>{{trans_choice('general.other_income',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('other_income.view'))
                            <li><a href="{{ url('other_income/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',2)}} {{trans_choice('general.other_income',1)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('other_income.create'))
                            <li><a href="{{ url('other_income/create') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.add',2)}} {{trans_choice('general.other_income',1)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('other_income.create'))
                            <li><a href="{{ url('other_income/type/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',2)}} {{trans_choice('general.other_income',1)}} {{trans_choice('general.type',2)}}
                                </a></li>
                        @endif
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('collateral'))
                <li class="treeview @if(Request::is('collateral/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-list"></i> <span>{{trans_choice('general.collateral',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('collateral.view'))
                            <li><a href="{{ url('collateral/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',2)}} {{trans_choice('general.collateral',2)}} {{trans_choice('general.register',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('collateral.create'))
                            <li><a href="{{ url('collateral/type/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.manage',2)}} {{trans_choice('general.collateral',2)}} {{trans_choice('general.type',2)}}
                                </a></li>
                        @endif
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('reports'))
                <li class="treeview @if(Request::is('report/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-bar-chart"></i> <span>{{trans_choice('general.report',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ url('report/cash_flow') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.cash_flow',2)}}
                            </a></li>
                        <li><a href="{{ url('report/profit_loss') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.profit_loss',2)}}
                            </a></li>

                        <li><a href="{{ url('report/collection') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.collection',2)}} {{trans_choice('general.report',1)}}
                            </a></li>
                        <li><a href="{{ url('report/balance_sheet') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.balance',1)}} {{trans_choice('general.sheet',1)}}
                            </a></li>
                        <li><a href="{{ url('report/loan_list') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.loan',1)}} {{trans_choice('general.list',1)}}
                            </a></li>
                        <li><a href="{{ url('report/loan_balance') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.loan',1)}} {{trans_choice('general.balance',1)}}
                            </a></li>
                        <li><a href="{{ url('report/loan_classification') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.loan',1)}} {{trans_choice('general.classification',1)}}
                            </a></li>
                        <li><a href="{{ url('report/loan_transaction') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.loan',1)}} {{trans_choice('general.transaction',1)}}
                            </a></li>
                        <li><a href="{{ url('report/loan_projection') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.collection',1)}} {{trans_choice('general.projection',1)}}
                            </a></li>
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('communication'))
                <li class="treeview @if(Request::is('asset/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-briefcase"></i> <span>{{trans_choice('general.asset',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ url('asset/data') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.view',1)}} {{trans_choice('general.asset',2)}}
                            </a></li>
                        <li><a href="{{ url('asset/create') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.add',1)}} {{trans_choice('general.asset',1)}}
                            </a></li>
                        <li><a href="{{ url('asset/type/data') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.manage',1)}} {{trans_choice('general.asset',1)}} {{trans_choice('general.type',2)}}
                            </a></li>
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('communication'))
                <li class="treeview @if(Request::is('communication/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-envelope"></i> <span>{{trans_choice('general.communication',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ url('communication/email') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.email',1)}}
                            </a></li>
                        <li><a href="{{ url('communication/sms') }}"><i
                                        class="fa fa-circle-o"></i> {{trans_choice('general.sms',2)}}
                            </a></li>
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('custom_fields'))
                <li class="treeview @if(Request::is('custom_field/*')) active @endif">
                    <a href="#">
                        <i class="fa fa-users"></i> <span>{{trans_choice('general.custom_field',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('custom_fields.view'))
                            <li><a href="{{ url('custom_field/data') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.view',2)}} {{trans_choice('general.custom_field',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('custom_fields.create'))
                            <li><a href="{{ url('custom_field/create') }}"><i
                                            class="fa fa-circle-o"></i> {{trans_choice('general.add',2)}} {{trans_choice('general.custom_field',1)}}
                                </a></li>
                        @endif
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('users'))
                <li class="treeview @if(Request::is('user/*')) active @endif">
                    <a href="{{ url('user/data') }}">
                        <i class="fa fa-users"></i> <span>{{trans_choice('general.user',2)}}</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        @if(Sentinel::hasAccess('users.view'))
                            <li><a href="{{ url('user/data') }}">
                                    <i class="fa fa-circle-o"></i>
                                    <span>{{trans_choice('general.view',2)}} {{trans_choice('general.user',2)}}</span>
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('users.roles'))
                            <li><a href="{{ url('user/role/data') }}"><i
                                            class="fa fa-circle-o"></i>{{trans_choice('general.manage',2)}} {{trans_choice('general.role',2)}}
                                </a></li>
                        @endif
                        @if(Sentinel::hasAccess('users.create'))
                            <li><a href="{{ url('user/create') }}"><i
                                            class="fa fa-circle-o"></i>{{trans_choice('general.add',2)}} {{trans_choice('general.user',2)}}
                                </a></li>
                        @endif
                    </ul>
                </li>
            @endif
            @if(Sentinel::hasAccess('audit_trail'))
                <li class="@if(Request::is('audit_trail/*')) active @endif">
                    <a href="{{ url('audit_trail/data') }}">
                        <i class="fa fa-area-chart"></i> <span>{{trans_choice('general.audit_trail',2)}}</span>
                    </a>
                </li>
            @endif
            @if(Sentinel::hasAccess('settings'))
                <li class="@if(Request::is('setting/*')) active @endif">
                    <a href="{{ url('setting/data') }}">
                        <i class="fa fa-cog"></i> <span>{{trans_choice('general.setting',2)}}</span>
                    </a>
                </li>
            @endif
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
