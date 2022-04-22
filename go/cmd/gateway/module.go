package main

// Module is an application module
type Module struct {
	ID        string `json:"id,omitempty"`
	Title     string `json:"title,omitempty"`
	Permalink string `json:"permalink,omitempty"`
}

// Modules represents the list of the application modules
type Modules struct {
	Entities map[string]Module `json:"entities,omitempty"`
	IDs      []string          `json:"ids,omitempty"`
}

func (m Modules) getModuleByID(id string) Module {
	// fmt.Println("Module:", m.Entities[id])
	return m.Entities[id]
}

// GetAppModules returns list of the modules for a given app ID
func (m Modules) GetAppModules(ID string) *Modules {
	entities := make(map[string]Module)
	for _, v := range applications.getAppModuleIDs(ID) {
		entities[v] = m.getModuleByID(v)
	}
	ids := applications.getAppModuleIDs(ID)
	modules := &Modules{
		Entities: entities,
		IDs:      ids,
	}
	return modules
}

var modules Modules = Modules{
	Entities: map[string]Module{
		"19f59e93-111f-4073-a35b-ebe503444f69": {
			ID:        "19f59e93-111f-4073-a35b-ebe503444f69",
			Title:     "Home",
			Permalink: "/",
		},
		"b782042d-51e3-43a6-8e34-5c9775640586": {
			ID:        "b782042d-51e3-43a6-8e34-5c9775640586",
			Title:     "Help",
			Permalink: "help",
		},
		"9a84c3f2-c84b-4e44-b2b5-3ad9fa1840e4": {
			ID:        "9a84c3f2-c84b-4e44-b2b5-3ad9fa1840e4",
			Title:     "Zones",
			Permalink: "zones",
		},
		"502d3926-63a6-4cd5-a18d-01dfa6c64454": {
			ID:        "502d3926-63a6-4cd5-a18d-01dfa6c64454",
			Title:     "Routes",
			Permalink: "routes",
		},
		"12eb993e-3c0d-4c8a-b517-313b1225363f": {
			ID:        "12eb993e-3c0d-4c8a-b517-313b1225363f",
			Title:     "Customers",
			Permalink: "customers",
		},
		"7f7d075b-fb9f-46dc-b668-e561a753daed": {
			ID:        "7f7d075b-fb9f-46dc-b668-e561a753daed",
			Title:     "Suppliers",
			Permalink: "suppliers",
		},
		"af9ed27e-36e0-46e0-81e6-e9ab23735b9e": {
			ID:        "af9ed27e-36e0-46e0-81e6-e9ab23735b9e",
			Title:     "Projects",
			Permalink: "projects",
		},
		"a9813694-e774-41c1-8a80-612600551f91": {
			ID:        "a9813694-e774-41c1-8a80-612600551f91",
			Title:     "Manifests",
			Permalink: "manifests",
		},
		"626d3414-08ef-4274-a2bb-77633834d93e": {
			ID:        "626d3414-08ef-4274-a2bb-77633834d93e",
			Title:     "Quotes",
			Permalink: "quotes",
		},
		"755931c0-94d0-4625-8cc9-5b9e2baaa2f0": {
			ID:        "755931c0-94d0-4625-8cc9-5b9e2baaa2f0",
			Title:     "Consignments",
			Permalink: "consignments",
		},
		"43b2919d-8221-4e9d-91a8-97a633cbb48e": {
			ID:        "43b2919d-8221-4e9d-91a8-97a633cbb48e",
			Title:     "Parcels",
			Permalink: "parcels",
		},
		"20e60e8c-f86a-4522-855c-0e08f2c3bc58": {
			ID:        "20e60e8c-f86a-4522-855c-0e08f2c3bc58",
			Title:     "Accounts",
			Permalink: "accounts",
		},
	},
	IDs: []string{
		"9a84c3f2-c84b-4e44-b2b5-3ad9fa1840e4",
		"502d3926-63a6-4cd5-a18d-01dfa6c64454",
		"12eb993e-3c0d-4c8a-b517-313b1225363f",
		"7f7d075b-fb9f-46dc-b668-e561a753daed",
		"af9ed27e-36e0-46e0-81e6-e9ab23735b9e",
		"a9813694-e774-41c1-8a80-612600551f91",
		"626d3414-08ef-4274-a2bb-77633834d93e",
		"755931c0-94d0-4625-8cc9-5b9e2baaa2f0",
		"43b2919d-8221-4e9d-91a8-97a633cbb48e",
		"20e60e8c-f86a-4522-855c-0e08f2c3bc58",
		"19f59e93-111f-4073-a35b-ebe503444f69",
		"b782042d-51e3-43a6-8e34-5c9775640586",
	},
}
