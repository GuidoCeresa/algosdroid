package it.algos.algosdroid


import grails.test.mixin.*
import spock.lang.*

@TestFor(ActivationController)
@Mock(Activation)
class ActivationControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.activationInstanceList
        model.activationInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.activationInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        def activation = new Activation()
        activation.validate()
        controller.save(activation)

        then: "The create view is rendered again with the correct model"
        model.activationInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        activation = new Activation(params)

        controller.save(activation)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/activation/show/1'
        controller.flash.message != null
        Activation.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def activation = new Activation(params)
        controller.show(activation)

        then: "A model is populated containing the domain instance"
        model.activationInstance == activation
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def activation = new Activation(params)
        controller.edit(activation)

        then: "A model is populated containing the domain instance"
        model.activationInstance == activation
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/activation/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def activation = new Activation()
        activation.validate()
        controller.update(activation)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.activationInstance == activation

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        activation = new Activation(params).save(flush: true)
        controller.update(activation)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/activation/show/$activation.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/activation/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def activation = new Activation(params).save(flush: true)

        then: "It exists"
        Activation.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(activation)

        then: "The instance is deleted"
        Activation.count() == 0
        response.redirectedUrl == '/activation/index'
        flash.message != null
    }
}
