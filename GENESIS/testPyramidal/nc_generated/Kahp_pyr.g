

// **************************************************
// File generated by: neuroConstruct v1.7.0 
// **************************************************

// This file holds the implementation in GENESIS of the Cell Mechanism:
// Kahp_pyr (Type: Channel mechanism, Model: Template based ChannelML file)

// with parameters: 
// /channelml/@units = SI Units 
// /channelml/notes = ChannelML file containing a single Calcium-dependent Potassium Channel description, from the Hippocampal CA3 neuron model presented in Traub et al., 1 ... 
// /channelml/channel_type/@name = Kahp_pyr 
// /channelml/channel_type/@density = yes 
// /channelml/channel_type/status/@value = in_progress 
// /channelml/channel_type/status/comment = Transcribed from the Genesis implementation by David Beeman 
// /channelml/channel_type/status/contributor[1]/name = Padraig Gleeson 
// /channelml/channel_type/status/contributor[2]/name = Boris Marin 
// /channelml/channel_type/authorList/modelTranslator[1]/name = Padraig Gleeson 
// /channelml/channel_type/authorList/modelTranslator[1]/institution = UCL 
// /channelml/channel_type/authorList/modelTranslator[1]/email = p.gleeson - at - ucl.ac.uk 
// /channelml/channel_type/authorList/modelTranslator[2]/name = Boris Marin 
// /channelml/channel_type/authorList/modelTranslator[2]/institution = UCL 
// /channelml/channel_type/authorList/modelTranslator[2]/email = b.marin - at - ucl.ac.uk 
// /channelml/channel_type/publication/fullTitle = Traub, R. D., Wong, R. K., Miles, R., and Michelson, H. (1991). A model of a CA3 hippocampal pyramidal neuron incorporating voltage-clamp data on intr ... 
// /channelml/channel_type/publication/pubmedRef = http://www.ncbi.nlm.nih.gov/pubmed/1663538 
// /channelml/channel_type/neuronDBref/modelName = K channels 
// /channelml/channel_type/neuronDBref/uri = http://senselab.med.yale.edu/neurondb/NeuronProp.aspx?id=259&amp;mo=1&amp;re=&amp;pr=C 
// /channelml/channel_type/current_voltage_relation/@cond_law = ohmic 
// /channelml/channel_type/current_voltage_relation/@ion = k 
// /channelml/channel_type/current_voltage_relation/@default_gmax = 2.656e-08 
// /channelml/channel_type/current_voltage_relation/@default_erev = -0.075 
// /channelml/channel_type/current_voltage_relation/conc_dependence/@name = Calcium 
// /channelml/channel_type/current_voltage_relation/conc_dependence/@ion = ca 
// /channelml/channel_type/current_voltage_relation/conc_dependence/@charge = 2 
// /channelml/channel_type/current_voltage_relation/conc_dependence/@variable_name = ca_conc 
// /channelml/channel_type/current_voltage_relation/conc_dependence/@min_conc = 0.0 
// /channelml/channel_type/current_voltage_relation/conc_dependence/@max_conc = 1000 
// /channelml/channel_type/current_voltage_relation/gate/@name = z 
// /channelml/channel_type/current_voltage_relation/gate/@instances = 1 
// /channelml/channel_type/current_voltage_relation/gate/closed_state/@id = z0 
// /channelml/channel_type/current_voltage_relation/gate/open_state/@id = z 
// /channelml/channel_type/current_voltage_relation/gate/transition[1]/@name = alpha 
// /channelml/channel_type/current_voltage_relation/gate/transition[1]/@from = z0 
// /channelml/channel_type/current_voltage_relation/gate/transition[1]/@to = z 
// /channelml/channel_type/current_voltage_relation/gate/transition[1]/@expr_form = generic 
// /channelml/channel_type/current_voltage_relation/gate/transition[1]/@expr = ca_conc &lt; 500.0 ? 0.02 * ca_conc : 10 
// /channelml/channel_type/current_voltage_relation/gate/transition[2]/@name = beta 
// /channelml/channel_type/current_voltage_relation/gate/transition[2]/@from = z 
// /channelml/channel_type/current_voltage_relation/gate/transition[2]/@to = z0 
// /channelml/channel_type/current_voltage_relation/gate/transition[2]/@expr_form = generic 
// /channelml/channel_type/current_voltage_relation/gate/transition[2]/@expr = 1.0 
// /channelml/channel_type/impl_prefs/table_settings/@max_v = 1000 
// /channelml/channel_type/impl_prefs/table_settings/@min_v = 0 
// /channelml/channel_type/impl_prefs/table_settings/@table_divisions = 3000 

// File from which this was generated: /home/boris/git/ACnet2/neuroConstruct/cellMechanisms/Kahp_pyr/Kahp.xml

// XSL file with mapping to simulator: /home/boris/git/ACnet2/neuroConstruct/cellMechanisms/Kahp_pyr/ChannelML_v1.8.1_GENESIStab.xsl



// This is a GENESIS script file generated from a ChannelML v1.8.1 file
// The ChannelML file is mapped onto a tabchannel object


// Units of ChannelML file: SI Units, units of GENESIS file generated: SI Units

/*
    ChannelML file containing a single Calcium-dependent Potassium Channel description, from the Hippocampal CA3 neuron model presented in Traub et al., 1991.
*/

function make_Kahp_pyr

        str chanpath = "/library/Kahp_pyr"

        if ({exists {chanpath}})
            return
        end
        
        create tabchannel {chanpath}
            

        setfield {chanpath} \ 
            Ek              -0.075 \
            Ik              0  \
            Zpower          1
        
        setfield {chanpath} \
            Gbar 2.656e-08 \
            Gk              0 

        
        // No Q10 temperature adjustment found
        float temp_adj_z = 1
    

        float tab_divs = 3000

        // Channel is dependent on concentration of: Calcium, rate equations will involve variable: ca_conc
        float c
        float conc_min = 0.0
        float conc_max = 1000

        float dc = ({conc_max} - {conc_min})/{tab_divs}

        float ca_conc = {conc_min}

            


            
        call {chanpath} TABCREATE Z {tab_divs} {conc_min} {conc_max}
            

        for (c = 0; c <= ({tab_divs}); c = c + 1)
                    
            // Looking at rate: alpha
                

            float alpha
                
                        
            // Found a generic form of rate equation for alpha, using expression: ca_conc < 500.0 ? 0.02 * ca_conc : 10
            // Will translate this for GENESIS compatibility...
                    

            if (ca_conc < 500.0 )
                alpha =  0.02 * ca_conc 
            else
                alpha =  10
            end
        
            
            // Looking at rate: beta
                

            float beta
                
                        
            // Found a generic form of rate equation for beta, using expression: 1.0
            // Will translate this for GENESIS compatibility...
                    beta = 1.0
            

            // Using the alpha and beta expressions to populate the tables

            float tau = 1/(temp_adj_z * (alpha + beta))
            
            setfield {chanpath} Z_A->table[{c}] {temp_adj_z * alpha}
            setfield {chanpath} Z_B->table[{c}] {temp_adj_z * (alpha + beta)}
                    ca_conc = ca_conc + dc
                
                
        end // end of for (c = 0; c <= ({tab_divs}); c = c + 1)
                
        setfield {chanpath} Z_conc 1
        setfield {chanpath} Z_A->calc_mode 1 Z_B->calc_mode 1
                    


end

