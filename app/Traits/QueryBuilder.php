<?php

namespace App\Traits;

trait QueryBuilder
{
    /**
     * Get the allowedFilters attributes for the model.
     *
     * @return array
     */
    static function allowedFilters()
    {
        if (property_exists(__CLASS__, 'allowedFilters')) {
            return self::$allowedFilters;
        }

        return [];
    }

    /**
     * Get the allowedSorts attributes for the model.
     *
     * @return array
     */
    static function allowedSorts()
    {
        if (property_exists(__CLASS__, 'allowedSorts')) {
            return self::$allowedSorts;
        }

        return [];
    }

    /**
     * Get the allowedIncludes attributes for the model.
     *
     * @return array
     */
    static function allowedIncludes()
    {
        if (property_exists(__CLASS__, 'allowedIncludes')) {
            return self::$allowedIncludes;
        }

        return [];
    }

    /**
     * Get the allowedFields attributes for the model.
     *
     * @return array
     */
    static function allowedFields()
    {
        if (property_exists(__CLASS__, 'allowedFields')) {
            return self::$allowedFields;
        }

        return [];
    }
}
