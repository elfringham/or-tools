# ---------- C++ support ----------
.PHONY: help_cc # Generate list of C++ targets with descriptions.
help_cc:
	@echo Use one of the following C++ targets:
ifeq ($(SYSTEM),win)
	@$(GREP) "^.PHONY: .* #" $(CURDIR)/makefiles/Makefile.cpp.mk | $(SED) "s/\.PHONY: \(.*\) # \(.*\)/\1\t\2/"
	@echo off & echo(
else
	@$(GREP) "^.PHONY: .* #" $(CURDIR)/makefiles/Makefile.cpp.mk | $(SED) "s/\.PHONY: \(.*\) # \(.*\)/\1\t\2/" | expand -t20
	@echo
endif

# Checks if the user has overwritten default install prefix.
# cf https://www.gnu.org/prep/standards/html_node/Directory-Variables.html#index-prefix
ifeq ($(SYSTEM),win)
  prefix ?= C:\\Program Files\\or-tools
else
  prefix ?= /usr/local
endif

# All libraries and dependecies
ifeq ($(PLATFORM),WIN64)
OR_TOOLS_LIBS = $(LIB_DIR)/$(LIB_PREFIX)ortools.$L
else
ifeq ($(PLATFORM),MACOSX)
OR_TOOLS_LIBS = $(LIB_DIR)/$(LIB_PREFIX)ortools.$(OR_TOOLS_MAJOR).$L
else
OR_TOOLS_LIBS = $(LIB_DIR)/$(LIB_PREFIX)ortools.$L.$(OR_TOOLS_MAJOR)
endif
endif

# Main target
.PHONY: cc # Build C++ OR-Tools library.
.PHONY: test_cc # Run all C++ OR-Tools test targets.

ortools_libs: $(OR_TOOLS_LIBS)
ortools-libs: $(OR_TOOLS_LIBS)
or_tools_libs: $(OR_TOOLS_LIBS)
or-tools-libs: $(OR_TOOLS_LIBS)

# OR Tools unique library.
$(OR_TOOLS_LIBS): $(THIRD_PARTY_TARGET)
	cmake --build dependencies --target install --config RELEASE -j 8
	$(TOUCH) $(OR_TOOLS_LIBS)

all: $(OR_TOOLS_LIBS)

test_cc: \
 $(OR_TOOLS_LIBS) \
 test_cc_tests \
 test_cc_contrib \
 test_cc_cpp

.PHONY: test_fz
test_fz: \
 cc \
 rfz_golomb \
 rfz_alpha



$(GEN_DIR):
	-$(MKDIR_P) $(GEN_PATH)

$(GEN_DIR)/ortools: | $(GEN_DIR)
	-$(MKDIR_P) $(GEN_PATH)$Sortools

$(GEN_DIR)/ortools/algorithms: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Salgorithms

$(GEN_DIR)/ortools/bop: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Sbop

$(GEN_DIR)/ortools/constraint_solver: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Sconstraint_solver

$(GEN_DIR)/ortools/flatzinc: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Sflatzinc

$(GEN_DIR)/ortools/glop: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Sglop

$(GEN_DIR)/ortools/graph: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Sgraph

$(GEN_DIR)/ortools/gscip: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Sgscip

$(GEN_DIR)/ortools/init: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Sinit

$(GEN_DIR)/ortools/linear_solver: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Slinear_solver

$(GEN_DIR)/ortools/packing: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Spacking

$(GEN_DIR)/ortools/sat: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Ssat

$(GEN_DIR)/ortools/scheduling: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Sscheduling

$(GEN_DIR)/ortools/util: | $(GEN_DIR)/ortools
	-$(MKDIR) $(GEN_PATH)$Sortools$Sutil

$(GEN_DIR)/examples: | $(GEN_DIR)
	-$(MKDIR) $(GEN_PATH)$Sexamples

$(GEN_DIR)/examples/cpp: | $(GEN_DIR)/examples
	-$(MKDIR) $(GEN_PATH)$Sexamples$Scpp

$(BIN_DIR):
	-$(MKDIR) $(BIN_DIR)

$(LIB_DIR):
	-$(MKDIR) $(LIB_DIR)

$(OBJ_DIR):
	-$(MKDIR) $(OBJ_DIR)

$(OBJ_DIR)/algorithms: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Salgorithms

$(OBJ_DIR)/base: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sbase

$(OBJ_DIR)/bop: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sbop

$(OBJ_DIR)/constraint_solver: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sconstraint_solver

$(OBJ_DIR)/flatzinc: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sflatzinc

$(OBJ_DIR)/glop: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sglop

$(OBJ_DIR)/graph: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sgraph

$(OBJ_DIR)/gscip: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sgscip

$(OBJ_DIR)/gurobi: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sgurobi

$(OBJ_DIR)/linear_solver: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Slinear_solver

$(OBJ_DIR)/lp_data: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Slp_data

$(OBJ_DIR)/packing: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Spacking

$(OBJ_DIR)/port: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sport

$(OBJ_DIR)/sat: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Ssat

$(OBJ_DIR)/scheduling: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sscheduling

$(OBJ_DIR)/util: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sutil

$(OBJ_DIR)/swig: | $(OBJ_DIR)
	-$(MKDIR_P) $(OBJ_DIR)$Sswig

include $(OR_ROOT)makefiles/Makefile.gen.mk

##################
##  Sat solver  ##
##################
sat: $(BIN_DIR)/sat_runner$E

$(OBJ_DIR)/sat_runner.$O: \
 $(CC_EX_DIR)/sat_runner.cc \
 $(CC_EX_DIR)/opb_reader.h \
 $(CC_EX_DIR)/sat_cnf_reader.h \
 $(SAT_DEPS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -I$(SRC_DIR) -c $(CC_EX_PATH)$Ssat_runner.cc $(OBJ_OUT)$(OBJ_DIR)$Ssat_runner.$O

##################
##  C++ SOURCE  ##
##################
ifeq ($(SOURCE_SUFFIX),.cc) # Those rules will be used if SOURCE contain a .cc file
$(OBJ_DIR)/$(SOURCE_NAME).$O: $(SOURCE) $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) \
 -c $(SOURCE_PATH) \
 $(OBJ_OUT)$(OBJ_DIR)$S$(SOURCE_NAME).$O

$(BIN_DIR)/$(SOURCE_NAME)$E: $(OBJ_DIR)/$(SOURCE_NAME).$O $(OR_TOOLS_LIBS) | $(BIN_DIR)
	$(CCC) $(CFLAGS) \
 $(OBJ_DIR)$S$(SOURCE_NAME).$O \
 $(OR_TOOLS_LNK) $(OR_TOOLS_LDFLAGS) \
 $(EXE_OUT)$(BIN_DIR)$S$(SOURCE_NAME)$E

.PHONY: build # Build a C++ program.
build: $(BIN_DIR)/$(SOURCE_NAME)$E

.PHONY: run # Run a C++ program.
run: build
	$(BIN_DIR)$S$(SOURCE_NAME)$E $(ARGS)
endif

##################################
##  CPP Tests/Examples/Samples  ##
##################################
# Generic Command
$(OBJ_DIR)/%.$O: $(TEST_DIR)/%.cc $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c $(TEST_PATH)$S$*.cc $(OBJ_OUT)$(OBJ_DIR)$S$*.$O

$(OBJ_DIR)/%.$O: $(CC_EX_DIR)/%.cc $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c $(CC_EX_PATH)$S$*.cc $(OBJ_OUT)$(OBJ_DIR)$S$*.$O

$(OBJ_DIR)/%.$O: $(CONTRIB_EX_DIR)/%.cc $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c $(CONTRIB_EX_PATH)$S$*.cc $(OBJ_OUT)$(OBJ_DIR)$S$*.$O

$(OBJ_DIR)/%.$O: ortools/algorithms/samples/%.cc $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c ortools$Salgorithms$Ssamples$S$*.cc $(OBJ_OUT)$(OBJ_DIR)$S$*.$O

$(OBJ_DIR)/%.$O: ortools/graph/samples/%.cc $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c ortools$Sgraph$Ssamples$S$*.cc $(OBJ_OUT)$(OBJ_DIR)$S$*.$O

$(OBJ_DIR)/%.$O: ortools/linear_solver/samples/%.cc $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c ortools$Slinear_solver$Ssamples$S$*.cc $(OBJ_OUT)$(OBJ_DIR)$S$*.$O

$(OBJ_DIR)/%.$O: ortools/constraint_solver/samples/%.cc $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c ortools$Sconstraint_solver$Ssamples$S$*.cc $(OBJ_OUT)$(OBJ_DIR)$S$*.$O

$(OBJ_DIR)/%.$O: ortools/sat/samples/%.cc $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c ortools$Ssat$Ssamples$S$*.cc $(OBJ_OUT)$(OBJ_DIR)$S$*.$O

$(OBJ_DIR)/%.$O: ortools/routing/samples/%.cc $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c ortools$Srouting$Ssamples$S$*.cc $(OBJ_OUT)$(OBJ_DIR)$S$*.$O

$(BIN_DIR)/%$E: $(OBJ_DIR)/%.$O $(OR_TOOLS_LIBS) | $(BIN_DIR)
	$(CCC) $(CFLAGS) $(OBJ_DIR)$S$*.$O $(OR_TOOLS_LNK) $(OR_TOOLS_LDFLAGS) $(EXE_OUT)$(BIN_DIR)$S$*$E

rcc_%: $(BIN_DIR)/%$E FORCE
	$(BIN_DIR)$S$*$E $(ARGS)

##################################
##  Course scheduling example   ##
##################################

examples/cpp/course_scheduling.proto: ;

$(CC_GEN_DIR)/course_scheduling.pb.cc: \
 $(SRC_DIR)/examples/cpp/course_scheduling.proto | $(GEN_DIR)/examples/cpp
	$(PROTOC) --proto_path=$(INC_DIR) $(PROTOBUF_PROTOC_INC) --cpp_out=$(GEN_PATH) $(SRC_DIR)/examples/cpp/course_scheduling.proto

$(CC_GEN_DIR)/course_scheduling.pb.h: \
  $(CC_GEN_DIR)/course_scheduling.pb.cc
	$(TOUCH) $(GEN_PATH)$Scourse_scheduling.pb.h

$(OBJ_DIR)/course_scheduling.$O: $(CC_EX_DIR)/course_scheduling.cc $(CC_EX_DIR)/course_scheduling.h $(CC_GEN_DIR)/course_scheduling.pb.h $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c $(CC_EX_PATH)$Scourse_scheduling.cc $(OBJ_OUT)$(OBJ_DIR)$Scourse_scheduling.$O

$(OBJ_DIR)/course_scheduling_run.$O: $(CC_EX_DIR)/course_scheduling_run.cc $(CC_EX_DIR)/course_scheduling.h $(CC_GEN_DIR)/course_scheduling.pb.h $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c $(CC_EX_PATH)$Scourse_scheduling_run.cc $(OBJ_OUT)$(OBJ_DIR)$Scourse_scheduling_run.$O


$(OBJ_DIR)/course_scheduling.pb.$O: $(CC_GEN_DIR)/course_scheduling.pb.cc $(CC_GEN_DIR)/course_scheduling.pb.h $(OR_TOOLS_LIBS) | $(OBJ_DIR)
	$(CCC) $(CFLAGS) -c $(CC_GEN_PATH)$Scourse_scheduling.pb.cc $(OBJ_OUT)$(OBJ_DIR)$Scourse_scheduling.pb.$O

$(BIN_DIR)/course_scheduling$E: $(OBJ_DIR)/course_scheduling.$O $(OBJ_DIR)/course_scheduling_run.$O $(OBJ_DIR)/course_scheduling.pb.$O $(OR_TOOLS_LIBS) | $(BIN_DIR)
	$(CCC) $(CFLAGS) $(OBJ_DIR)$Scourse_scheduling.$O $(OBJ_DIR)$Scourse_scheduling_run.$O $(OBJ_DIR)$Scourse_scheduling.pb.$O $(OR_TOOLS_LNK) $(OR_TOOLS_LDFLAGS) $(EXE_OUT)$(BIN_DIR)$Scourse_scheduling$E

rcc_course_scheduling: $(BIN_DIR)/course_scheduling$E FORCE
	$(BIN_DIR)$S$*$E $(ARGS)

##################################
##  Test targets                ##
##################################

.PHONY: test_cc_algorithms_samples # Build and Run all C++ Algorithms Samples (located in ortools/algorithms/samples)
test_cc_algorithms_samples: \
 rcc_knapsack \
 rcc_simple_knapsack_program

.PHONY: test_cc_graph_samples # Build and Run all C++ Graph Samples (located in ortools/graph/samples)
test_cc_graph_samples: \
 rcc_simple_max_flow_program \
 rcc_simple_min_cost_flow_program

.PHONY: test_cc_linear_solver_samples # Build and Run all C++ LP Samples (located in ortools/linear_solver/samples)
test_cc_linear_solver_samples: \
 rcc_assignment_mip \
 rcc_basic_example \
 rcc_bin_packing_mip \
 rcc_integer_programming_example \
 rcc_linear_programming_example \
 rcc_mip_var_array \
 rcc_multiple_knapsack_mip \
 rcc_simple_lp_program \
 rcc_simple_mip_program \
 rcc_stigler_diet

.PHONY: test_cc_constraint_solver_samples # Build and Run all C++ CP Samples (located in ortools/constraint_solver/samples)
test_cc_constraint_solver_samples: \
 rcc_minimal_jobshop_cp \
 rcc_nurses_cp \
 rcc_rabbits_and_pheasants_cp \
 rcc_simple_ls_program \
 rcc_simple_cp_program \
 rcc_simple_routing_program \
 rcc_tsp \
 rcc_tsp_cities \
 rcc_tsp_circuit_board \
 rcc_tsp_distance_matrix \
 rcc_vrp \
 rcc_vrp_breaks \
 rcc_vrp_capacity \
 rcc_vrp_drop_nodes \
 rcc_vrp_global_span \
 rcc_vrp_initial_routes \
 rcc_vrp_pickup_delivery \
 rcc_vrp_pickup_delivery_fifo \
 rcc_vrp_pickup_delivery_lifo \
 rcc_vrp_resources \
 rcc_vrp_starts_ends \
 rcc_vrp_time_windows \
 rcc_vrp_with_time_limit

.PHONY: test_cc_sat_samples # Build and Run all C++ Sat Samples (located in ortools/sat/samples)
test_cc_sat_samples: \
 rcc_assignment_sat \
 rcc_assumptions_sample_sat \
 rcc_binpacking_problem_sat \
 rcc_bool_or_sample_sat \
 rcc_channeling_sample_sat \
 rcc_cp_is_fun_sat \
 rcc_earliness_tardiness_cost_sample_sat \
 rcc_interval_sample_sat \
 rcc_literal_sample_sat \
 rcc_no_overlap_sample_sat \
 rcc_optional_interval_sample_sat \
 rcc_rabbits_and_pheasants_sat \
 rcc_ranking_sample_sat \
 rcc_reified_sample_sat \
 rcc_search_for_all_solutions_sample_sat \
 rcc_simple_sat_program \
 rcc_solution_hinting_sample_sat \
 rcc_solve_and_print_intermediate_solutions_sample_sat \
 rcc_solve_with_time_limit_sample_sat \
 rcc_step_function_sample_sat \
 rcc_stop_after_n_solutions_sample_sat

.PHONY: check_cc_pimpl
check_cc_pimpl: \
 test_cc_algorithms_samples \
 test_cc_constraint_solver_samples \
 test_cc_graph_samples \
 test_cc_linear_solver_samples \
 test_cc_sat_samples \
 \
 rcc_linear_programming \
 rcc_constraint_programming_cp \
 rcc_integer_programming \
 rcc_knapsack \
 rcc_max_flow \
 rcc_min_cost_flow ;

.PHONY: test_cc_tests # Build and Run all C++ Tests (located in ortools/examples/tests)
test_cc_tests: \
 rcc_lp_test \
 rcc_bug_fz1 \
 rcc_cpp11_test \
 rcc_forbidden_intervals_test \
 rcc_issue57 \
 rcc_min_max_test
#	$(MAKE) rcc_issue173 # error: too long

.PHONY: test_cc_contrib # Build and Run all C++ Contrib (located in ortools/examples/contrib)
test_cc_contrib: ;

.PHONY: test_cc_cpp # Build and Run all C++ Examples (located in ortools/examples/cpp)
test_cc_cpp: \
 rcc_costas_array_sat \
 rcc_cryptarithm_sat \
 rcc_cvrp_disjoint_tw \
 rcc_cvrptw \
 rcc_cvrptw_with_breaks \
 rcc_cvrptw_with_refueling \
 rcc_cvrptw_with_resources \
 rcc_cvrptw_with_stop_times_and_resources \
 rcc_flow_api \
 rcc_linear_assignment_api \
 rcc_linear_solver_protocol_buffers \
 rcc_magic_sequence_sat \
 rcc_magic_square_sat \
 rcc_nqueens \
 rcc_random_tsp \
 rcc_slitherlink_sat \
 rcc_strawberry_fields_with_column_generation \
 rcc_uncapacitated_facility_location \
 rcc_weighted_tardiness_sat
	$(MAKE) run \
 SOURCE=examples/cpp/dimacs_assignment.cc \
 ARGS=examples/data/dimacs/assignment/small.asn
	$(MAKE) run \
 SOURCE=examples/cpp/dobble_ls.cc \
 ARGS="--time_limit_in_ms=10000"
	$(MAKE) run \
 SOURCE=examples/cpp/golomb_sat.cc \
 ARGS="--size=5"
	$(MAKE) run \
 SOURCE=examples/cpp/jobshop_sat.cc \
 ARGS="--input=examples/data/jobshop/ft06"
	$(MAKE) run \
 SOURCE=examples/cpp/mps_driver.cc \
 ARGS="--input examples/data/tests/test.mps"
	$(MAKE) run \
 SOURCE=examples/cpp/network_routing_sat.cc \
 ARGS="--clients=10 --backbones=5 --demands=10 --traffic_min=5 --traffic_max=10 --min_client_degree=2 --max_client_degree=5 --min_backbone_degree=3 --max_backbone_degree=5 --max_capacity=20 --fixed_charge_cost=10"
	$(MAKE) run \
 SOURCE=examples/cpp/sports_scheduling_sat.cc \
 ARGS="--params max_time_in_seconds:10.0"
#	$(MAKE) run SOURCE=examples/cpp/frequency_assignment_problem.cc  # Need data file
#	$(MAKE) run SOURCE=examples/cpp/pdptw.cc ARGS="--pdp_file examples/data/pdptw/LC1_2_1.txt" # Fails on windows...
	$(MAKE) run SOURCE=examples/cpp/shift_minimization_sat.cc  ARGS="--input examples/data/shift_scheduling/minimization/data_1_23_40_66.dat"
	$(MAKE) run \
 SOURCE=examples/cpp/solve.cc \
 ARGS="--input examples/data/tests/test2.mps"

rfz_%: $(BIN_DIR)/fz
	$(BIN_DIR)$Sfz$E $(FZ_EX_PATH)$S$*.fzn

#################
##  Packaging  ##
#################
TEMP_PACKAGE_CC_DIR = temp_package_cc

$(TEMP_PACKAGE_CC_DIR):
	-$(MKDIR_P) $(TEMP_PACKAGE_CC_DIR)

package_cc_pimpl: cc | $(TEMP_PACKAGE_CC_DIR)
	$(MAKE) install_libortools prefix=$(TEMP_PACKAGE_CC_DIR)$S$(INSTALL_DIR)
	$(MAKE) install_third_party prefix=$(TEMP_PACKAGE_CC_DIR)$S$(INSTALL_DIR)
ifeq ($(SYSTEM),win)
	cd $(TEMP_PACKAGE_CC_DIR) && ..$S$(ZIP) -r ..$S$(INSTALL_DIR)$(ARCHIVE_EXT) $(INSTALL_DIR)
else
	$(TAR) -C $(TEMP_PACKAGE_CC_DIR) --no-same-owner -czvf $(INSTALL_DIR)$(ARCHIVE_EXT) $(INSTALL_DIR)
endif

###############
##  INSTALL  ##
###############
# ref: https://www.gnu.org/prep/standards/html_node/Directory-Variables.html#index-prefix
# ref: https://www.gnu.org/prep/standards/html_node/DESTDIR.html
install_dirs:
	-$(MKDIR_P) "$(DESTDIR)$(prefix)"
	-$(MKDIR) "$(DESTDIR)$(prefix)$Slib"
	-$(MKDIR) "$(DESTDIR)$(prefix)$Sbin"
	-$(MKDIR) "$(DESTDIR)$(prefix)$Sshare"
	-$(MKDIR) "$(DESTDIR)$(prefix)$Sshare$Sdoc"
	-$(MKDIR) "$(DESTDIR)$(prefix)$Sshare$Sdoc$Sortools"
	-$(MKDIR) "$(DESTDIR)$(prefix)$Sshare$Sdoc$Sortools$Ssat"
	-$(MKDIR) "$(DESTDIR)$(prefix)$Sshare$Sdoc$Sortools$Ssat$Sdoc"	

# Install C++ OR-Tools to $(DESTDIR)$(prefix)
.PHONY: install_cc
install_cc: | install_dirs
	$(COPY) LICENSE-2.0.txt "$(DESTDIR)$(prefix)"
	$(COPYREC) include "$(DESTDIR)$(prefix)"
	$(COPY) $(LIB_DIR)$S$(LIB_PREFIX)ortools.$L "$(DESTDIR)$(prefix)$Slib"
	$(COPY) bin$Sprotoc* "$(DESTDIR)$(prefix)$Sbin"
	$(COPYREC) share "$(DESTDIR)$(prefix)"
	$(COPY) ortools$Ssat$Sdoc$S*.md "$(DESTDIR)$(prefix)$Sshare$Sdoc$Sortools$Ssat$Sdoc"

#######################
##  EXAMPLE ARCHIVE  ##
#######################
TEMP_CC_DIR=temp_cpp

$(TEMP_CC_DIR):
	$(MKDIR) $(TEMP_CC_DIR)

$(TEMP_CC_DIR)/ortools_examples: | $(TEMP_CC_DIR)
	$(MKDIR) $(TEMP_CC_DIR)$Sortools_examples

$(TEMP_CC_DIR)/ortools_examples/examples: | $(TEMP_CC_DIR)/ortools_examples
	$(MKDIR) $(TEMP_CC_DIR)$Sortools_examples$Sexamples

$(TEMP_CC_DIR)/ortools_examples/examples/cpp: | $(TEMP_CC_DIR)/ortools_examples/examples
	$(MKDIR) $(TEMP_CC_DIR)$Sortools_examples$Sexamples$Scpp

$(TEMP_CC_DIR)/ortools_examples/examples/data: | $(TEMP_CC_DIR)/ortools_examples/examples
	$(MKDIR) $(TEMP_CC_DIR)$Sortools_examples$Sexamples$Sdata

.PHONY: cc_examples_archive # Build stand-alone C++ examples archive file for redistribution.
cc_examples_archive: | \
 $(TEMP_CC_DIR)/ortools_examples/examples/cpp \
 $(TEMP_CC_DIR)/ortools_examples/examples/data
	$(COPY) $(CC_EX_PATH)$S*.h $(TEMP_CC_DIR)$Sortools_examples$Sexamples$Scpp
	$(COPY) $(CC_EX_PATH)$S*.cc $(TEMP_CC_DIR)$Sortools_examples$Sexamples$Scpp
#	$(COPY) $(CONTRIB_EX_PATH)$S*.cc $(TEMP_CC_DIR)$Sortools_examples$Sexamples$Scpp
	$(COPY) ortools$Salgorithms$Ssamples$S*.cc $(TEMP_CC_DIR)$Sortools_examples$Sexamples$Scpp
	$(COPY) ortools$Sgraph$Ssamples$S*.cc $(TEMP_CC_DIR)$Sortools_examples$Sexamples$Scpp
	$(COPY) ortools$Slinear_solver$Ssamples$S*.cc $(TEMP_CC_DIR)$Sortools_examples$Sexamples$Scpp
	$(COPY) ortools$Sconstraint_solver$Ssamples$S*.cc $(TEMP_CC_DIR)$Sortools_examples$Sexamples$Scpp
	$(COPY) ortools$Ssat$Ssamples$S*.cc $(TEMP_CC_DIR)$Sortools_examples$Sexamples$Scpp
	$(COPY) tools$SREADME.cpp.md $(TEMP_CC_DIR)$Sortools_examples$SREADME.md
	$(COPY) LICENSE-2.0.txt $(TEMP_CC_DIR)$Sortools_examples
ifeq ($(SYSTEM),win)
	cd $(TEMP_CC_DIR)\ortools_examples \
 && ..\..\$(TAR) -C ..\.. -c -v \
 --exclude *svn* --exclude *roadef* --exclude *vector_packing* \
 examples\data | ..\..\$(TAR) xvm
	cd $(TEMP_CC_DIR) \
 && ..\$(ZIP) \
 -r ..\or-tools_cpp_examples_v$(OR_TOOLS_VERSION).zip \
 ortools_examples
else
	cd $(TEMP_CC_DIR)/ortools_examples \
 && tar -C ../.. -c -v \
 --exclude *svn* --exclude *roadef* --exclude *vector_packing* \
 examples/data | tar xvm
	cd $(TEMP_CC_DIR) \
 && tar -c -v -z --no-same-owner \
 -f ../or-tools_cpp_examples$(PYPI_OS)_v$(OR_TOOLS_VERSION).tar.gz \
 ortools_examples
endif
	-$(DELREC) $(TEMP_CC_DIR)$Sortools_examples

################
##  Cleaning  ##
################
CC_SAMPLES := $(wildcard ortools/*/samples/*.cc)
CC_SAMPLES := $(notdir $(CC_SAMPLES))
CC_SAMPLES := $(addsuffix $E, $(addprefix $(BIN_DIR)$S, $(basename $(CC_SAMPLES))))

CC_EXAMPLES := $(wildcard $(CC_EX_DIR)/*.cc)
CC_EXAMPLES := $(notdir $(CC_EXAMPLES))
CC_EXAMPLES := $(addsuffix $E, $(addprefix $(BIN_DIR)$S, $(basename $(CC_EXAMPLES))))

CC_TESTS := $(wildcard $(TEST_DIR)/*.cc)
CC_TESTS := $(notdir $(CC_TESTS))
CC_TESTS := $(addsuffix $E, $(addprefix $(BIN_DIR)$S, $(basename $(CC_TESTS))))

.PHONY: clean_cc # Clean C++ output from previous build.
clean_cc:
	-$(DEL) $(LIB_DIR)$S$(LIB_PREFIX)cvrptw_lib.$L
	-$(DEL) $(LIB_DIR)$S$(LIB_PREFIX)dimacs.$L
	-$(DEL) $(LIB_DIR)$S$(LIB_PREFIX)fap.$L
	-$(DEL) $(LIB_DIR)$S$(LIB_PREFIX)fz.$L
	-$(DEL) $(LIB_DIR)$S$(LIB_PREFIX)ortools*.$L*
	-$(DEL) $(LIB_DIR)$S$(LIB_PREFIX)flatzinc*.$L*
	-$(DEL) $(LIB_DIR)$S$(LIB_PREFIX)*.a
	-$(DEL) $(OBJ_DIR)$S*.$O
	-$(DELREC) $(OBJ_DIR)
	-$(DEL) $(BIN_DIR)$Sortools.msc
	-$(DEL) $(BIN_DIR)$Sfz$E
	-$(DEL) $(BIN_DIR)$Sparser_main$E
	-$(DEL) $(BIN_DIR)$Ssat_runner$E
	-$(DEL) $(CC_SAMPLES)
	-$(DEL) $(CC_EXAMPLES)
	-$(DEL) $(CC_TESTS)
	-$(DEL) $(BIN_DIR)$S*.exp
	-$(DEL) $(BIN_DIR)$S*.lib
	-$(DELREC) $(TEMP_PACKAGE_CC_DIR)
	-$(DELREC) $(TEMP_CC_DIR)

.PHONY: clean_compat
clean_compat:
	-$(DELREC) $(OR_ROOT)constraint_solver
	-$(DELREC) $(OR_ROOT)linear_solver
	-$(DELREC) $(OR_ROOT)algorithms
	-$(DELREC) $(OR_ROOT)graph
	-$(DELREC) $(OR_ROOT)gen

#############
##  DEBUG  ##
#############
.PHONY: detect_cc # Show variables used to build C++ OR-Tools.
detect_cc:
	@echo Relevant info for the C++ build:
	@echo PROTOC = $(PROTOC)
	@echo CCC = $(CCC)
	@echo CFLAGS = $(CFLAGS)
	@echo LDFLAGS = $(LDFLAGS)
	@echo LINK_CMD = $(LINK_CMD)
	@echo DEPENDENCIES_INC = $(DEPENDENCIES_INC)
	@echo DEPENDENCIES_LNK = $(DEPENDENCIES_LNK)
	@echo SRC_DIR = $(SRC_DIR)
	@echo GEN_DIR = $(GEN_DIR)
	@echo CC_EX_DIR = $(CC_EX_DIR)
	@echo OBJ_DIR = $(OBJ_DIR)
	@echo LIB_DIR = $(LIB_DIR)
	@echo BIN_DIR = $(BIN_DIR)
	@echo prefix = $(prefix)
	@echo OR_TOOLS_LNK = $(OR_TOOLS_LNK)
	@echo OR_TOOLS_LDFLAGS = $(OR_TOOLS_LDFLAGS)
	@echo OR_TOOLS_LIBS = $(OR_TOOLS_LIBS)
ifeq ($(SYSTEM),win)
	@echo off & echo(
else
	@echo
endif
