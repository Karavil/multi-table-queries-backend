const knexConfig = require("../knexfile");
const db = require("knex")(knexConfig.development);

const Schemes = () => db("Schemes");
const SchemeSteps = () => db("Steps");

const find = () => {
   return Schemes().select("*");
};

const findById = (schemeId) => {
   return Schemes().select("*").where("id", schemeId);
};

const findSteps = (schemeId) => {
   return SchemeSteps()
      .select("*")
      .where("scheme_id", schemeId)
      .orderBy("step_number");
};

const add = (scheme) => {
   return Schemes()
      .insert(scheme)
      .then((idsAdded) => {
         return Schemes().findById(idsAdded[0]);
      });
};

const update = (changes, id) => {
   return Schemes()
      .where("id", id)
      .update(changes)
      .then(() => {
         return Schemes().findById(id);
      });
};

const remove = (id) => {
   return Schemes().where("id", id).del();
};

module.exports = {
   find,
   findById,
   findSteps,
   add,
   update,
   remove,
};
