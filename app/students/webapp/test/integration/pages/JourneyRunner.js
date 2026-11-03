sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"students/test/integration/pages/StudentList.gen",
	"students/test/integration/pages/StudentObjectPage.gen",
	"students/test/integration/pages/FavoriteGameObjectPage.gen"
], function (JourneyRunner, StudentListGenerated, StudentObjectPageGenerated, FavoriteGameObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('students') + '/test/flp.html#app-preview',
        pages: {
			onTheStudentListGenerated: StudentListGenerated,
			onTheStudentObjectPageGenerated: StudentObjectPageGenerated,
			onTheFavoriteGameObjectPageGenerated: FavoriteGameObjectPageGenerated
        },
        async: true
    });

    return runner;
});

