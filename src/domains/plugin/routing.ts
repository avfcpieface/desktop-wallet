import { PluginDetails, PluginManager } from "./pages";

export const PluginRoutes = [
	{
		path: "/profiles/:profileId/plugins/:pluginId",
		exact: true,
		component: PluginDetails,
	},
	{
		path: "/profiles/:profileId/plugins",
		exact: true,
		component: PluginManager,
	},
];
