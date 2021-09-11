package main

// type Uuid struct {
//   value string
// }

// Application ...
type Application struct {
	ID            string   `json:"id,omitempty"`
	Title         string   `json:"title,omitempty"`
	Component     string   `json:"component,omitempty"`
	Permalink     string   `json:"permalink,omitempty"`
	Modules       []string `json:"modules,omitempty"`
	DefaultModule string   `json:"defaultModule,omitempty"`
	LastModule    string   `json:"lastModule,omitempty"`
}

// Applications ...
type Applications struct {
	Entities map[string]Application `json:"entities,omitempty"`
	IDs      []string               `json:"ids,omitempty"`
}

func (a Applications) getApplications() Applications {
	return a
}

func (a Applications) getAppModuleIDs(id string) []string {
	// fmt.Println("AppModules:", a.Entities[id].Modules)
	return a.Entities[id].Modules
}

// Apps represents the list of system applications
var applications Applications = Applications{
	Entities: map[string]Application{
		"9a30119-d673-4978-b393-f608fe28ae07": {
			ID:            "9a30119-d673-4978-b393-f608fe28ae07",
			Title:         "Home",
			Component:     "view-home",
			Permalink:     "/",
			DefaultModule: "19f59e93-111f-4073-a35b-ebe503444f69",
			LastModule:    "",
			Modules: []string{
				"19f59e93-111f-4073-a35b-ebe503444f69",
				"b782042d-51e3-43a6-8e34-5c9775640586",
			},
		},
		"54789c07-bb43-4db4-8b2d-1a8e1f8c67f1": {
			ID:            "54789c07-bb43-4db4-8b2d-1a8e1f8c67f1",
			Title:         "Dispatch",
			Component:     "view-dispatch",
			Permalink:     "/dispatch",
			DefaultModule: "9a84c3f2-c84b-4e44-b2b5-3ad9fa1840e4",
			LastModule:    "",
			Modules: []string{
				"9a84c3f2-c84b-4e44-b2b5-3ad9fa1840e4",
				"502d3926-63a6-4cd5-a18d-01dfa6c64454",
				"af9ed27e-36e0-46e0-81e6-e9ab23735b9e",
				"a9813694-e774-41c1-8a80-612600551f91",
				"626d3414-08ef-4274-a2bb-77633834d93e",
				"755931c0-94d0-4625-8cc9-5b9e2baaa2f0",
				"43b2919d-8221-4e9d-91a8-97a633cbb48e",
			},
		},
		"c178025e-a209-4c50-8c34-36d35f36494c": {
			ID:            "c178025e-a209-4c50-8c34-36d35f36494c",
			Title:         "Sales",
			Component:     "view-sales",
			Permalink:     "/sales",
			DefaultModule: "12eb993e-3c0d-4c8a-b517-313b1225363f",
			LastModule:    "",
			Modules: []string{
				"12eb993e-3c0d-4c8a-b517-313b1225363f",
			},
		},
		"437642dd-7d74-4213-af76-b51fc24eff0": {
			ID:            "437642dd-7d74-4213-af76-b51fc24eff0",
			Title:         "Accounting",
			Component:     "app-users",
			Permalink:     "accounting",
			DefaultModule: "7f7d075b-fb9f-46dc-b668-e561a753daed",
			LastModule:    "",
			Modules: []string{
				"7f7d075b-fb9f-46dc-b668-e561a753daed",
			},
		},
		"5a2192a0-0051-46a1-85e7-17245ba24f55": {
			ID:            "5a2192a0-0051-46a1-85e7-17245ba24f55",
			Title:         "Settings",
			Component:     "app-signin",
			Permalink:     "/settings",
			DefaultModule: "20e60e8c-f86a-4522-855c-0e08f2c3bc58",
			LastModule:    "",
			Modules: []string{
				"20e60e8c-f86a-4522-855c-0e08f2c3bc58",
			},
		},
	},
	IDs: []string{
		"9a30119-d673-4978-b393-f608fe28ae07",
		"54789c07-bb43-4db4-8b2d-1a8e1f8c67f1",
		"c178025e-a209-4c50-8c34-36d35f36494c",
		"437642dd-7d74-4213-af76-b51fc24eff0",
		"5a2192a0-0051-46a1-85e7-17245ba24f55",
	},
}
